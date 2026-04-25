<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Review;

class ReviewController extends Controller
{
    public function index()
    {
        $reviews = Review::all();
        return response()->json($reviews);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_review' => 'required|unique:review,id_review',
            'id_pelanggan' => 'required|exists:pelanggan,id_pelanggan',
            'id_lahan' => 'required|exists:lahan,id_lahan',
            'rating' => 'required|integer|min:1|max:5',
            'komentar' => 'nullable|string',
            'tanggal_review' => 'required|date',
        ]);

        $review = Review::create($request->all());
        return response()->json($review, 201);
    }

    public function show($id)
    {
        $review = Review::findOrFail($id);
        return response()->json($review);
    }

    public function update(Request $request, $id)
    {
        $review = Review::findOrFail($id);

        $request->validate([
            'id_pelanggan' => 'sometimes|exists:pelanggan,id_pelanggan',
            'id_lahan' => 'sometimes|exists:lahan,id_lahan',
            'rating' => 'sometimes|integer|min:1|max:5',
            'komentar' => 'sometimes|string',
            'tanggal_review' => 'sometimes|date',
        ]);

        $review->update($request->all());
        return response()->json($review);
    }

    public function destroy($id)
    {
        $review = Review::findOrFail($id);
        $review->delete();
        return response()->json(['message' => 'Review deleted successfully']);
    }
}