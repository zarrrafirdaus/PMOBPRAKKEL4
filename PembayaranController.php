<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pembayaran;

class PembayaranController extends Controller
{
    public function index()
    {
        $pembayaran = Pembayaran::all();
        return response()->json($pembayaran);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_pembayaran' => 'required|unique:pembayaran,id_pembayaran',
            'id_sewa' => 'required|exists:penyewaan,id_sewa',
            'metode_pembayaran' => 'required|string|max:30',
            'tanggal_pembayaran' => 'required|date',
            'jumlah_pembayaran' => 'required|numeric',
            'status_pembayaran' => 'required|string|max:10',
        ]);

        $pembayaran = Pembayaran::create($request->all());
        return response()->json($pembayaran, 201);
    }

    public function show($id)
    {
        $pembayaran = Pembayaran::findOrFail($id);
        return response()->json($pembayaran);
    }

    public function update(Request $request, $id)
    {
        $pembayaran = Pembayaran::findOrFail($id);

        $request->validate([
            'id_sewa' => 'sometimes|exists:penyewaan,id_sewa',
            'metode_pembayaran' => 'sometimes|string|max:30',
            'tanggal_pembayaran' => 'sometimes|date',
            'jumlah_pembayaran' => 'sometimes|numeric',
            'status_pembayaran' => 'sometimes|string|max:10',
        ]);

        $pembayaran->update($request->all());
        return response()->json($pembayaran);
    }

    public function destroy($id)
    {
        $pembayaran = Pembayaran::findOrFail($id);
        $pembayaran->delete();
        return response()->json(['message' => 'Pembayaran deleted successfully']);
    }
}