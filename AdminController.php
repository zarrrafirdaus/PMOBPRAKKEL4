<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;

class AdminController extends Controller
{
    // Menampilkan semua admin
    public function index()
    {
        $admins = Admin::all();
        return response()->json(['success' => true, 'data' => $admins], 200);
    }

    // Menyimpan admin baru
    public function store(Request $request)
    {
        $request->validate([
            'id_admin' => 'required|string|unique:admin,id_admin',
            'nama_admin' => 'required|string|max:50',
            'email_admin' => 'required|email|unique:admin,email_admin',
            'password_admin' => 'required|string|min:6',
            'nohp_admin' => 'required|string|max:16',
        ]);

        $admin = Admin::create([
            'id_admin' => $request->id_admin,
            'nama_admin' => $request->nama_admin,
            'email_admin' => $request->email_admin,
            'password_admin' => bcrypt($request->password_admin),
            'nohp_admin' => $request->nohp_admin,
        ]);

        return response()->json(['success' => true, 'message' => 'Admin created', 'data' => $admin], 201);
    }

    // Menampilkan detail admin berdasarkan ID
    public function show($id)
    {
        $admin = Admin::find($id);
        if (!$admin) {
            return response()->json(['success' => false, 'message' => 'Admin not found'], 404);
        }
        return response()->json(['success' => true, 'data' => $admin], 200);
    }

    // Mengupdate data admin
    public function update(Request $request, $id)
    {
        $admin = Admin::find($id);
        if (!$admin) {
            return response()->json(['success' => false, 'message' => 'Admin not found'], 404);
        }

        $request->validate([
            'nama_admin' => 'sometimes|required|string|max:50',
            'email_admin' => 'sometimes|required|email|unique:admin,email_admin,' . $id . ',id_admin',
            'password_admin' => 'sometimes|required|string|min:6',
            'nohp_admin' => 'sometimes|required|string|max:16',
        ]);

        if ($request->has('password_admin')) {
            $request->merge(['password_admin' => bcrypt($request->password_admin)]);
        }

        $admin->update($request->all());

        return response()->json(['success' => true, 'message' => 'Admin updated', 'data' => $admin], 200);
    }

    // Menghapus admin
    public function destroy($id)
    {
        $admin = Admin::find($id);
        if (!$admin) {
            return response()->json(['success' => false, 'message' => 'Admin not found'], 404);
        }

        $admin->delete();
        return response()->json(['success' => true, 'message' => 'Admin deleted'], 200);
    }
}