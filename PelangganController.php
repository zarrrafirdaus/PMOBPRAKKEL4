<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pelanggan;

class PelangganController extends Controller
{
    public function index()
    {
        $pelanggans = Pelanggan::all();
        return response()->json(['success' => true, 'data' => $pelanggans], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_pelanggan' => 'required|string|unique:pelanggan,id_pelanggan',
            'nama_pelanggan' => 'required|string|max:30',
            'email_pelanggan' => 'required|email|unique:pelanggan,email_pelanggan',
            'password_pelanggan' => 'required|string|min:6',
            'nohp_pelanggan' => 'required|string|max:16',
            'alamat_pelanggan' => 'required|string|max:50',
            'tanggal_daftar' => 'required|date',
        ]);

        $pelanggan = Pelanggan::create([
            'id_pelanggan' => $request->id_pelanggan,
            'nama_pelanggan' => $request->nama_pelanggan,
            'email_pelanggan' => $request->email_pelanggan,
            'password_pelanggan' => bcrypt($request->password_pelanggan),
            'nohp_pelanggan' => $request->nohp_pelanggan,
            'alamat_pelanggan' => $request->alamat_pelanggan,
            'tanggal_daftar' => $request->tanggal_daftar,
        ]);

        return response()->json(['success' => true, 'message' => 'Pelanggan created', 'data' => $pelanggan], 201);
    }

    public function show($id)
    {
        $pelanggan = Pelanggan::find($id);
        if (!$pelanggan) {
            return response()->json(['success' => false, 'message' => 'Pelanggan not found'], 404);
        }
        return response()->json(['success' => true, 'data' => $pelanggan], 200);
    }

    public function update(Request $request, $id)
    {
        $pelanggan = Pelanggan::find($id);
        if (!$pelanggan) {
            return response()->json(['success' => false, 'message' => 'Pelanggan not found'], 404);
        }

        $request->validate([
            'nama_pelanggan' => 'sometimes|required|string|max:30',
            'email_pelanggan' => 'sometimes|required|email|unique:pelanggan,email_pelanggan,' . $id . ',id_pelanggan',
            'password_pelanggan' => 'sometimes|required|string|min:6',
            'nohp_pelanggan' => 'sometimes|required|string|max:16',
            'alamat_pelanggan' => 'sometimes|required|string|max:50',
            'tanggal_daftar' => 'sometimes|required|date',
        ]);

        if ($request->has('password_pelanggan')) {
            $request->merge(['password_pelanggan' => bcrypt($request->password_pelanggan)]);
        }

        $pelanggan->update($request->all());

        return response()->json(['success' => true, 'message' => 'Pelanggan updated', 'data' => $pelanggan], 200);
    }

    public function destroy($id)
    {
        $pelanggan = Pelanggan::find($id);
        if (!$pelanggan) {
            return response()->json(['success' => false, 'message' => 'Pelanggan not found'], 404);
        }

        $pelanggan->delete();
        return response()->json(['success' => true, 'message' => 'Pelanggan deleted'], 200);
    }
}