<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lahan;

class LahanController extends Controller
{
    public function index()
    {
        $lahans = Lahan::all();
        return response()->json(['success' => true, 'data' => $lahans], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_lahan' => 'required|string|unique:lahan,id_lahan',
            'id_admin' => 'required|exists:admin,id_admin',
            'nama_lahan' => 'required|string|max:30',
            'lokasi_lahan' => 'required|string|max:30',
            'luas_lahan' => 'required|string|max:30',
            'jenis_tanah' => 'required|string|max:20',
            'sumber_air' => 'required|string|max:20',
            'harga_sewa' => 'required|numeric',
            'deskripsi_lahan' => 'nullable|string',
            'status_lahan' => 'nullable|integer',
            'foto_lahan' => 'nullable|string|max:50',
            'nama_pemilik' => 'nullable|string|max:30',
            'nohp_pemilik' => 'nullable|string|max:16',
        ]);

        $lahan = Lahan::create($request->all());
        return response()->json(['success' => true, 'message' => 'Lahan created', 'data' => $lahan], 201);
    }

    public function show($id)
    {
        $lahan = Lahan::find($id);
        if (!$lahan) return response()->json(['success' => false, 'message' => 'Lahan not found'], 404);
        return response()->json(['success' => true, 'data' => $lahan], 200);
    }

    public function update(Request $request, $id)
    {
        $lahan = Lahan::find($id);
        if (!$lahan) return response()->json(['success' => false, 'message' => 'Lahan not found'], 404);

        $request->validate([
            'id_admin' => 'sometimes|exists:admin,id_admin',
            'nama_lahan' => 'sometimes|required|string|max:30',
            'lokasi_lahan' => 'sometimes|required|string|max:30',
            'luas_lahan' => 'sometimes|required|string|max:30',
            'jenis_tanah' => 'sometimes|string|max:20',
            'sumber_air' => 'sometimes|string|max:20',
            'harga_sewa' => 'sometimes|numeric',
            'deskripsi_lahan' => 'nullable|string',
            'status_lahan' => 'nullable|integer',
            'foto_lahan' => 'nullable|string|max:50',
            'nama_pemilik' => 'nullable|string|max:30',
            'nohp_pemilik' => 'nullable|string|max:16',
        ]);

        $lahan->update($request->all());
        return response()->json(['success' => true, 'message' => 'Lahan updated', 'data' => $lahan], 200);
    }

    public function destroy($id)
    {
        $lahan = Lahan::find($id);
        if (!$lahan) return response()->json(['success' => false, 'message' => 'Lahan not found'], 404);

        $lahan->delete();
        return response()->json(['success' => true, 'message' => 'Lahan deleted'], 200);
    }
}