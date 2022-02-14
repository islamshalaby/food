@extends('admin.app')

@section('title' , __('messages.option_edit'))

@section('content')
    <div class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.option_edit') }}</h4>
                 </div>
        </div>
        <form action="" method="post" enctype="multipart/form-data" >
            @csrf
                      
            <div class="form-group mb-4">
                <label for="title_en">{{ __('messages.title_en') }}</label>
                <input required type="text" name="title_en" class="form-control" id="title_en" placeholder="{{ __('messages.title_en') }}" value="{{ $data['option']['title_en'] }}" >
            </div>
            <div class="form-group mb-4">
                <label for="title_ar">{{ __('messages.title_ar') }}</label>
                <input required type="text" name="title_ar" class="form-control" id="title_ar" placeholder="{{ __('messages.title_ar') }}" value="{{ $data['option']['title_ar'] }}" >
            </div>
            <div class="form-group">
                <label for="category">{{ __('messages.category') }}</label>
                <select id="category" name="category_id" class="form-control">
                    <option selected>{{ __('messages.select') }}</option>
                    @foreach ( $data['categories'] as $category )
                    <option {{ $category->id == $data['option']['category']['id'] ? 'selected' : '' }} value="{{ $category->id }}">{{ App::isLocale('en') ? $category->title_en : $category->title_ar }}</option>
                    @endforeach
                </select>
            </div>
            <input type="submit" value="{{ __('messages.submit') }}" class="btn btn-primary">
        </form>
    </div>
@endsection