<?php

namespace App\Http\Controllers\BackEnd;

use Inertia\Inertia;
use App\Models\PageName;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\PageSaveRequest;

class PageController extends Controller
{
    //page list
    public function pageList()
    {
        $pageList = PageName::orderBy('rank', 'asc')->get();
        return Inertia::render('BackEnd/PageName/PageNameListPage', ['pageList' => $pageList]);
    }

    //page save page
    public function pageSavePage(Request $request)
    {

        $pageName = PageName::find($request->page_id);
        return Inertia::render('BackEnd/PageName/PageNameSavePage', ['pageName' => $pageName]);
    }

    // Page Save
    public function pageSave(PageSaveRequest $request)
    {
        $pageName = $request->name;
        $slug = Str::slug($pageName);
        PageName::create([
            'name' => $pageName,
            'slug' => $slug,
            'rank' => $request->rank
        ]);

        return redirect()->back()->with([
            'status' => true,
            'message' => 'Page Created Successfully',
        ]);
    }

    // Page Update
    public function pageUpdate(PageSaveRequest $request, $id)
    {
        $pageName = $request->name;
        $slug = Str::slug($pageName);

        $page = PageName::findOrFail($id);
        $page->update([
            'name' => $pageName,
            'slug' => $slug,
            'rank' => $request->rank
        ]);

        return redirect()->back()->with([
            'status' => true,
            'message' => 'Page Updated Successfully',
        ]);
    }

    //page delete
    public function pageDelete($id)
    {
        $page = PageName::findOrFail($id);
        $page->delete();
        return redirect()->back()->with(['status' => true, 'message' => 'Page Deleted Successfully']);
    }
}
