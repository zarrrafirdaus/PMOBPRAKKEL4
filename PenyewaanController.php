<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Penyewaan;

class PenyewaanController extends Controller
{
    public function index()
    {
        $penyewaan = Penyewaan::all();
        return response()->json($penyewaan);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_sewa' => 'required|unique:penyewaan,id_sewa',
            'id_lahan' => 'required|exists:lahan,id_lahan',
            'id_pelanggan' => 'required|exists:pelanggan,id_pelanggan',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date',
            'durasi_sewa' => 'required|integer',
            'total_biaya' => 'required|numeric',
            'status_sewa' => 'required|string|max:15',
        ]);

        $penyewaan = Penyewaan::create($request->all());
        return response()->json($penyewaan, 201);
    }

    public function show($id)
    {
        $penyewaan = Penyewaan::findOrFail($id);
        return response()->json($penyewaan);
    }

    public function update(Request $request, $id)
    {
        $penyewaan = Penyewaan::findOrFail($id);

        $request->validate([
            'id_lahan' => 'sometimes|exists:lahan,id_lahan',
            'id_pelanggan' => 'sometimes|exists:pelanggan,id_pelanggan',
            'tanggal_mulai' => 'sometimes|date',
            'tanggal_selesai' => 'sometimes|date',
            'durasi_sewa' => 'sometimes|integer',
            'total_biaya' => 'sometimes|numeric',
            'status_sewa' => 'sometimes|string|max:15',
        ]);

        $penyewaan->update($request->all());
        return response()->json($penyewaan);
    }

    public function destroy($id)
    {
        $penyewaan = Penyewaan::findOrFail($id);
        $penyewaan->delete();
        return response()->json(['message' => 'Penyewaan deleted successfully']);
    }
}