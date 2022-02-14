@extends('admin.app')

@section('title' , __('messages.product_edit'))

@push('scripts')
    <script>
        var language = "{{ Config::get('app.locale') }}",
            select = "{{ __('messages.select') }}",
            siblingsCont = $("#category_options_sibling").html()
            
        $("#category").on("change", function() {
            $('select#brand').html("")
            
            var categoryId = $(this).find("option:selected").val(),
                productCategoryId = "{{ $data['product']['category_id'] }}"
            if (categoryId == productCategoryId) {
                $("#category_options_sibling .form-group").show()
                $("#category_options_sibling .form-group input").prop("disabled", false)
            }else {
                $("#category_options_sibling .form-group").hide()
                $("#category_options_sibling .form-group input").prop("disabled", true)
            }
            
            
            $.ajax({
                url : "/admin-panel/sub_categories/fetchbrand/" + categoryId,
                type : 'GET',
                success : function (data) {
                    $('#brandsParent').show()
                    $('select#brand').prop("disabled", false)
                    $('#sub_category_select').parent('.form-group').hide()
                    $('select#sub_category_select').prop("disabled", true)
                    $('select#brand').prepend(
                            `<option selected disabled>${select}</option>`
                        )
                    data.forEach(function (brand) {
                        var brandName = brand.title_en
                        if (language == 'ar') {
                            brandName = brand.title_ar
                        }
                        $('select#brand').append(
                            "<option value='" + brand.id + "'>" + brandName + "</option>"
                        )
                    })
                }
            })

            $("#category_options .row").html("")
            $.ajax({
                url : "/admin-panel/products/fetchcategoryoptions/" + categoryId,
                type : 'GET',
                success : function (data) {
                    
                    $("#category_options").show()
                    
                    data.forEach(function (option) {
                        var optionName = option.title_en,
                            elms = "{{ $data['prod_options'] }}",
                            checked = ""

                        if (language == 'ar') {
                            optionName = option.title_ar
                        }
                        if (elms.includes(option.id)) {
                            checked = "checked"
                        }
                        
                        $("#category_options .row").append(`
                        <div class="col-6">
                            <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
                              <input ${checked} data-label="${optionName}" value="${option.id}" type="checkbox" class="new-control-input">
                              <span class="new-control-indicator"></span><span class="new-chk-content">${optionName}</span>
                            </label>
                        </div> 
                        `)
                    })
                }
            })

            // fetch sub category by category id
            $('select#sub_category_select').html("")
            $.ajax({
                url : "/admin-panel/products/fetchsubcategorybycategory/" + categoryId,
                type : 'GET',
                success : function (data) {
                    $('#sub_category_select').parent('.form-group').show()
                    $('select#sub_category_select').prop("disabled", false)
                    $('select#sub_category_select').prepend(
                            `<option selected disabled>${select}</option>`
                        )
                    data.forEach(function (subCategory) {
                        var subCategoryName = subCategory.title_en
                        if (language == 'ar') {
                            subCategoryName = subCategory.title_ar
                        }
                        $('select#sub_category_select').append(
                            "<option value='" + subCategory.id + "'>" + subCategoryName+ "</option>"
                        )
                    })
                }
            })
        })
        $("#brand").on("change", function() {
            $('select#sub_category_select').html("")
            var brandId = $(this).find("option:selected").val();
            
            $.ajax({
                url : "/admin-panel/products/fetchsubcategories/" + brandId,
                type : 'GET',
                success : function (data) {
                    $('#sub_category_select').parent('.form-group').show()
                    $('select#sub_category_select').prop("disabled", false)
                    $('select#sub_category_select').prepend(
                            `<option selected disabled>${select}</option>`
                        )
                    data.forEach(function (subCategory) {
                        var subCategoryName = subCategory.title_en
                        if (language == 'ar') {
                            subCategoryName = subCategory.title_ar
                        }
                        $('select#sub_category_select').append(
                            "<option value='" + subCategory.id + "'>" + subCategoryName+ "</option>"
                        )
                    })
                }
            })
        })

        var categoryId = $("#category").find("option:selected").val();
            
            $.ajax({
                url : "/admin-panel/sub_categories/fetchbrand/" + categoryId,
                type : 'GET',
                success : function (data) {
                    $('#brandsParent').show()
                    $('select#brand').prop("disabled", false)
                    
                    $('select#brand').prepend(
                        `<option selected disabled>${select}</option>`
                    )
                    data.forEach(function (brand) {
                        
                        var brandName = brand.title_en
                        if (language == 'ar') {
                            brandName = brand.title_ar
                        }
                        var selected = "",
                            brandId = "{{ $data['product']['brand_id'] }}"
                        if (brandId == brand.id) {
                            selected = "selected"
                        }
                        $('select#brand').append(
                            "<option " + selected + " value='" + brand.id + "'>" + brandName + "</option>"
                        )
                    })
                }
            })

            $.ajax({
                url : "/admin-panel/products/fetchcategoryoptions/" + categoryId,
                type : 'GET',
                success : function (data) {
                    
                    $("#category_options").show()
                    
                    data.forEach(function (option) {
                        var optionName = option.title_en,
                            elms = "{{ $data['prod_options'] }}",
                            checked = ""

                        if (language == 'ar') {
                            optionName = option.title_ar
                        }
                        if (elms.includes(option.id)) {
                            checked = "checked"
                        }
                        
                        $("#category_options .row").append(`
                        <div class="col-6">
                            <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
                              <input ${checked} data-label="${optionName}" value="${option.id}" type="checkbox" class="new-control-input">
                              <span class="new-control-indicator"></span><span class="new-chk-content">${optionName}</span>
                            </label>
                        </div> 
                        `)
                    })
                }
            })
            
          
            $.ajax({
                url : "/admin-panel/products/fetchsubcategorybycategory/" + categoryId,
                type : 'GET',
                success : function (data) {
                    $('#sub_category_select').parent('.form-group').show()
                    $('select#sub_category_select').prop("disabled", false)

                    $('select#sub_category_select').prepend(
                            `<option selected disabled>${select}</option>`
                        )
                    
                    data.forEach(function (subCategory) {
                        var subCategoryName = subCategory.title_en
                        if (language == 'ar') {
                            subCategoryName = subCategory.title_ar
                        }
                        var selected = "",
                            subCategoryId = "{{ $data['product']['sub_category_id'] }}"
                        if (subCategoryId == subCategory.id) {
                            selected = "selected"
                        }
                        
                        $('select#sub_category_select').append(
                            "<option " + selected + " value='" + subCategory.id + "'>" + subCategoryName+ "</option>"
                        )
                    })
                }
            })
            

            

            $("#discount").click(function() {
                if ($(this).is(':checked')) {
                    $("#offer_percentage").parent(".form-group").show()
                    $("#offer_percentage").prop('disabled', false)
                    $("#final_price").parent(".form-group").show()
                }else {
                    $("#offer_percentage").parent(".form-group").hide()
                    $("#offer_percentage").prop('disabled', true)
                    $("#final_price").parent(".form-group").hide()
                }
            })

            $("#offer_percentage").on("keyup", function () {
                var discountValue = $("#offer_percentage").val(),
                    price = $("#price_before_offer").val(),
                    discountNumber = Number(price) * (Number(discountValue) / 100),
                    total = Number(price) - discountNumber
                $("#final_price").val(total)
            })

            $("#price_before_offer").on("keyup", function () {
                var discountValue = $("#offer_percentage").val(),
                    price = $("#price_before_offer").val(),
                    discountNumber = Number(price) * (Number(discountValue) / 100),
                    total = Number(price) - discountNumber
                $("#final_price").val(total)
            })

            $("#category_options .row").on('click', 'input', function() {
                var label = $(this).data("label"),
                        labelEn = "English " + label,
                        labelAr = "Arabic " + label,
                        elementValue = $(this).val() + "element",
                        optionId = $(this).val()
                   
                   if (language == 'ar') {
                        labelEn = label + " باللغة الإنجليزية"
                        labelAr = label + " باللغة العربية"
                   }
               if($(this).is(':checked')) {
                    $("#category_options_sibling").append(`
                    <div class="form-group mb-4 ${elementValue}">
                        <label for="title_en">${labelEn}</label>
                        <input required type="text" name="value_en[]" class="form-control" id="title_en" placeholder="${labelEn}" value="" >
                    </div>
                    <div class="form-group mb-4 ${elementValue}">
                        <label for="title_en">${labelAr}</label>
                        <input required type="text" name="value_ar[]" class="form-control" id="title_en" placeholder="${labelAr}" value="" >
                    </div>
                    <input name="option[]" value="${optionId}" type="hidden" class="new-control-input ${elementValue}">
                    `)
               }else {
                   console.log("." + elementValue)
                $("." + elementValue).remove()
               }
            })

            $("#add_home").on("change", function() {
                if ($(this).is(':checked')) {
                    $("#home_section").prop("disabled", false)
                    $("#home_section").parent(".form-group").show()
                }else {
                    $("#home_section").prop("disabled", true)
                    $("#home_section").parent(".form-group").hide()
                }
            })

            var previous = "{{ __('messages.previous') }}",
                next = "{{ __('messages.next') }}",
                finish = "{{ __('messages.finish') }}"

                
            $(".actions ul").find('li').eq(0).children('a').text(previous)
            $(".actions ul").find('li').eq(1).children('a').text(next)
            $(".actions ul").find('li').eq(2).children('a').text(finish)

            // add class next1 to next button to control the first section
            $(".actions ul").find('li').eq(1).children('a').addClass("next1")
            
            // section one validation
            $(".actions ul").find('li').eq(1).on("mouseover", "a.next1", function() {
                var image = $('input[name="images[]"]').val(),
                    categorySelect = $("#category").val(),
                    subCategorySelect = $("#sub_category_select").val(),
                    titleEnInput = $("input[name='title_en']").val(),
                    titleArInput = $("input[name='title_ar']").val(),
                    descriptionEnText = $('textarea[name="description_en"]').val(),
                    descriptionArText = $('textarea[name="description_ar"]').val()

                if (categorySelect > 0 && subCategorySelect > 0 && titleEnInput.length > 0 && titleArInput.length > 0 && descriptionEnText.length > 0 && descriptionArText.length > 0) {
                    $(this).attr('href', '#next')
                    $(this).addClass('next2')
                    
                }else {
                    $(this).attr('href', '#')
                }
                
            })

            // show validation messages on section 1
            $(".actions ul").find('li').eq(1).on("click", "a[href='#']", function () {
                var categorySelect = $("#category").val(),
                    subCategorySelect = $("#sub_category_select").val(),
                    titleEnInput = $("input[name='title_en']").val(),
                    titleArInput = $("input[name='title_ar']").val(),
                    descriptionEnText = $('textarea[name="description_en"]').val(),
                    descriptionArText = $('textarea[name="description_ar"]').val()
                    imagesRequired = "{{ __('messages.images_required') }}",
                    categoryRequired = "{{ __('messages.category_required') }}",
                    subCategoryRequired = "{{ __('messages.sub_category_required') }}",
                    titleEnRequired = "{{ __('messages.title_en_required') }}",
                    titleArRequired = "{{ __('messages.title_ar_required') }}",
                    descriptionEnRequired = "{{ __('messages.description_en_required') }}",
                    descriptionArRequired = "{{ __('messages.description_ar_required') }}"

                
                
                
                if (categorySelect > 0) {
                    $(".category-required").remove()
                }else {
                    if ($(".category-required").length) {

                    }else {
                        $("#category").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 category-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${categoryRequired}</div>
                        `)
                    }
                }

                if (subCategorySelect > 0) {
                    $(".sub-category-required").remove()
                }else {
                    if ($(".sub-category-required").length) {

                    }else {
                        $("#sub_category_select").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 sub-category-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${subCategoryRequired}</div>
                        `)
                    }
                }

                if (titleEnInput.length == 0) {
                    if ($(".titleEn-required").length) {

                    }else {
                        $("input[name='title_en']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 titleEn-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${titleEnRequired}</div>
                        `)
                    }
                }else {
                    $(".titleEn-required").remove()
                }

                if (titleArInput.length == 0) {
                    if ($(".titleAr-required").length) {

                    }else {
                        $("input[name='title_ar']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 titleAr-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${titleArRequired}</div>
                        `)
                    }
                }else {
                    $(".titleAr-required").remove()
                }

                if (descriptionEnText.length == 0) {
                    if ($(".descEn-required").length) {

                    }else {
                        $('textarea[name="description_en"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 descEn-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${descriptionEnRequired}</div>
                        `)
                    }
                }else {
                    $(".descEn-required").remove()
                }

                if (descriptionArText.length == 0) {
                    if ($(".descAr-required").length) {

                    }else {
                        $('textarea[name="description_ar"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 descAr-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${descriptionArRequired}</div>
                        `)
                    }
                }else {
                    $(".descAr-required").remove()
                }
            })

            // section three validation 
            $(".actions ul").find('li').eq(2).on("mouseover", "a", function() {
                var totalQInput = $("input[name='total_quatity']").val(),
                    remainingQInput = $("input[name='remaining_quantity']").val(),
                    priceBOfferInput = $('input[name="price_before_offer"]').val(),
                    offerCheckbox = $('input[name="offer"]'),
                    offerPerc = ""

                if (offerCheckbox.is(':checked')) {
                    offerPerc = $('input[name="offer_percentage"]').val()

                    if (offerPerc > 0 && totalQInput > 0 && remainingQInput > 0 && priceBOfferInput > 0) {
                        $(this).prop('href', '#finish')
                    }else {
                        $(this).attr('href', '#')
                    }
                }else {
                    if (totalQInput > 0 && remainingQInput > 0 && totalQInput >= remainingQInput  && priceBOfferInput > 0) {
                        $(this).attr('href', '#finish')
                    }else {
                        $(this).attr('href', '#')
                    }
                }
            })

            // show validation messages on section 3
            $(".actions ul").find('li').eq(2).on("click", "a[href='#']", function() {
                var totalQInput = $("input[name='total_quatity']").val(),
                    remainingQInput = $("input[name='remaining_quantity']").val(),
                    priceBOfferInput = $('input[name="price_before_offer"]').val(),
                    offerCheckbox = $('input[name="offer"]'),
                    offerPerc = "",
                    totalQRequired = "{{ __('messages.total_quantity_required') }}",
                    remainingQRequired = "{{ __('messages.remaining_quantity_required') }}",
                    remainingQLessTotal = "{{ __('messages.remaining_q_less_total') }}",
                    priceRequired = "{{ __('messages.price_required') }}",
                    oferrVRequired = "{{ __('messages.offer_required') }}"

                if (offerCheckbox.is(':checked')) {
                    offerPerc = $('input[name="offer_percentage"]').val()

                    if (offerPerc <= 0) {
                        if ($(".offerV-required").length) {
    
                        }else {
                            $('input[name="offer_percentage"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 offerV-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${oferrVRequired}</div>
                            `)
                        }
                    }else {
                        $(".offerV-required").remove()
                    }

                    if (totalQInput <= 0) {
                        if ($(".totalQ-required").length) {
    
                        }else {
                            $('input[name="total_quatity"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 totalQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${totalQRequired}</div>
                            `)
                        }
                    }else {
                        $(".totalQ-required").remove()
                    }

                    if (remainingQInput <= 0) {
                        if ($(".remainingQ-required").length) {
    
                        }else {
                            $("input[name='remaining_quantity']").after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQRequired}</div>
                            `)
                        }
                    }else {
                        $(".remainingQ-required").remove()
                    }

                    if (remainingQInput > totalQInput) {
                        
                        if ($(".remainingQLess-required").length) {
    
                        }else {
                            $("input[name='remaining_quantity']").after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQLess-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQLessTotal}${totalQInput}</div>
                            `)
                        }
                        
                    }else {
                        $(".remainingQLess-required").remove()
                    }

                    if (priceBOfferInput <= 0) {
                        if ($(".priceBOffer-required").length) {
    
                        }else {
                            $('input[name="price_before_offer"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 priceBOffer-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${priceRequired}</div>
                            `)
                        }
                    }else {
                        $(".priceBOffer-required").remove()
                    }

                    
                }else {

                    if (totalQInput <= 0) {
                        if ($(".totalQ-required").length) {
    
                        }else {
                            $('input[name="total_quatity"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 totalQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${totalQRequired}</div>
                            `)
                        }
                    }else {
                        $(".totalQ-required").remove()
                    }

                    if (remainingQInput <= 0) {
                        if ($(".remainingQ-required").length) {
    
                        }else {
                            $("input[name='remaining_quantity']").after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQRequired}</div>
                            `)
                        }
                    }else {
                        $(".remainingQ-required").remove()
                    }

                    if (remainingQInput > totalQInput) {
                        if ($(".remainingQLess-required").length) {
    
                        }else {
                            $("input[name='remaining_quantity']").after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQLess-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQLessTotal}${totalQInput}</div>
                            `)
                        }
                        
                    }else {
                        $(".remainingQLess-required").remove()
                    }

                    if (priceBOfferInput <= 0) {
                        if ($(".priceBOffer-required").length) {
    
                        }else {
                            $('input[name="price_before_offer"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 priceBOffer-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${priceRequired}</div>
                            `)
                        }
                    }else {
                        $(".priceBOffer-required").remove()
                    }
                }
            })

            /*
            *  show / hide message on change value
            */
            
            // image
            $('input[name="images[]"]').on("change", function() {
                var image = $('input[name="images[]"]').val(),
                    imagesRequired = "{{ __('messages.images_required') }}"

                if (image.length > 0) {
                    if ($(".image-required").length) {
                        $(".image-required").remove()
                    }
                }else {
                    if ($(".image-required").length) {
                        
                    }else {
                        $('input[name="images[]"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 image-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${imagesRequired}</div>
                        `)
                    }
                }
            })

            // category
            $("#category").on("change", function() {
                var categorySelect = $("#category").val(),
                    categoryRequired = "{{ __('messages.category_required') }}"

                if (categorySelect > 0) {
                    if ($(".category-required").length) {
                        $(".category-required").remove()
                    }
                }else {
                    if ($(".category-required").length) {

                    }else {
                        $("#category").after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 category-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${categoryRequired}</div>
                            `)
                    }
                }
            })

            // sub category
            $("#sub_category_select").on("change", function() {
                var subCategorySelect = $("#sub_category_select").val(),
                    subCategoryRequired = "{{ __('messages.sub_category_required') }}"

                if (subCategorySelect > 0) {
                    if ($(".sub-category-required").length) {
                        $(".sub-category-required").remove()
                    } 
                }else {
                    if ($(".sub-category-required").length) {

                    }else {
                        $("#sub_category_select").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 sub-category-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${subCategoryRequired}</div>
                        `)
                    }
                }
            })

            // title en
            $("input[name='title_en']").on("keyup", function() {
                var titleEnInput = $("input[name='title_en']").val(),
                    titleEnRequired = "{{ __('messages.title_en_required') }}"

                if (titleEnInput.length > 0) {
                    if ($(".titleEn-required").length) {
                        $(".titleEn-required").remove()
                    }
                }else {
                    if ($(".titleEn-required").length) {
                        
                    }else {
                        $("input[name='title_en']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 titleEn-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${titleEnRequired}</div>
                        `)
                    }
                }
            })

            // title ar
            $("input[name='title_ar']").on("keyup", function() {
                var titleArInput = $("input[name='title_ar']").val(),
                    titleArRequired = "{{ __('messages.title_ar_required') }}"

                if (titleArInput.length > 0) {
                    if ($(".titleAr-required").length) {
                        $(".titleAr-required").remove()
                    }
                }else {
                    if ($(".titleAr-required").length) {
                        
                    }else {
                        $("input[name='title_ar']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 titleAr-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${titleArRequired}</div>
                        `)
                    }
                }
            })

            // description en
            $('textarea[name="description_en"]').on("keyup", function() {
                var descriptionEnText = $('textarea[name="description_en"]').val(),
                    descriptionEnRequired = "{{ __('messages.description_en_required') }}"

                if (descriptionEnText.length > 0) {
                    if ($(".descEn-required").length) {
                        $(".descEn-required").remove()
                    }
                }else {
                    if ($(".descEn-required").length) {

                    }else {
                        $('textarea[name="description_en"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 descEn-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${descriptionEnRequired}</div>
                        `)
                    }
                }
            })
            
            // description ar
            $('textarea[name="description_ar"]').on("keyup", function() {
                var descriptionArText = $('textarea[name="description_ar"]').val(),
                    descriptionArRequired = "{{ __('messages.description_ar_required') }}"

                if (descriptionArText.length > 0) {
                    if ($(".descAr-required").length) {
                        $(".descAr-required").remove()
                    }
                }else {
                    if ($(".descAr-required").length) {

                    }else {
                        $('textarea[name="description_ar"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 descAr-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${descriptionArRequired}</div>
                        `)
                    }
                }
            })

            // total quantity
            $("input[name='total_quatity']").on("keyup", function() {
                var totalQInput = $("input[name='total_quatity']").val(),
                    totalQRequired = "{{ __('messages.total_quantity_required') }}"

                if (totalQInput <= 0) {
                    if ($(".totalQ-required").length) {

                    }else {
                        $('input[name="total_quatity"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 totalQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${totalQRequired}</div>
                        `)
                    }
                }else {
                    $(".totalQ-required").remove()
                }
            })

            // remaining quantity
            $("input[name='remaining_quantity']").on("keyup", function() {
                var remainingQInput = $("input[name='remaining_quantity']").val(),
                    totalQInput = $("input[name='total_quatity']").val(),
                    remainingQRequired = "{{ __('messages.remaining_quantity_required') }}",
                    remainingQLessTotal = "{{ __('messages.remaining_q_less_total') }}"

                if (remainingQInput <= 0) {
                    if ($(".remainingQ-required").length) {

                    }else {
                        $("input[name='remaining_quantity']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQ-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQRequired}</div>
                        `)
                    }
                }else {
                    $(".remainingQ-required").remove()
                }

                if (remainingQInput > totalQInput) {
                    if ($(".remainingQLess-required").length) {

                    }else {
                        $("input[name='remaining_quantity']").after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 remainingQLess-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${remainingQLessTotal}${totalQInput}</div>
                        `)
                    }
                    
                }else {
                    $(".remainingQLess-required").remove()
                }
            })

            // price before offer
            $('input[name="price_before_offer"]').on("keyup", function() {
                var priceBOfferInput = $('input[name="price_before_offer"]').val(),
                    priceRequired = "{{ __('messages.price_required') }}"

                if (priceBOfferInput <= 0) {
                    if ($(".priceBOffer-required").length) {
    
                    }else {
                        $('input[name="price_before_offer"]').after(`
                        <div style="margin-top:20px" class="alert alert-outline-danger mb-4 priceBOffer-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${priceRequired}</div>
                        `)
                    }
                }else {
                    $(".priceBOffer-required").remove()
                }
            })

            // offer value where offer checked
            $('input[name="offer"]').on("click", function() {

                if ($(this).is(":checked")) {
                    offerPerc = $('input[name="offer_percentage"]').val()

                    if (offerPerc <= 0) {
                        if ($(".offerV-required").length) {
    
                        }else {
                            $('input[name="offer_percentage"]').after(`
                            <div style="margin-top:20px" class="alert alert-outline-danger mb-4 offerV-required" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-dismiss="alert"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button><i class="flaticon-cancel-12 close" data-dismiss="alert"></i> ${oferrVRequired}</div>
                            `)
                        }
                    }else {
                        $(".offerV-required").remove()
                    }
                }
            })
            

            // submit form on click finish
            $(".actions ul").find('li').eq(2).on("click", 'a[href="#finish"]', function () {
                $("form").submit()
            })

    </script>
@endpush

@section('content')
    <div class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.product_edit') }}</h4>
                 </div>
        </div>
        @if($errors->any())
            <div class="alert alert-danger">
                <ul class="list-unstyled mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <form action="" method="post" enctype="multipart/form-data" >
            @csrf
            <div class="form-group mb-4">
                <label for="">{{ __('messages.current_images') }}</label><br>
                <div class="row">
                @if (count($data['product']->images) > 0)
                    @foreach ($data['product']->images as $image)
                    <div style="position : relative" class="col-md-2 product_image">
                        <a onclick="return confirm('{{ __('messages.are_you_sure') }}')" style="position : absolute; right : 20px" href="{{ route('productImage.delete', $image->id) }}" class="close">x</a>
                        <img style="width: 100%" src="https://res.cloudinary.com/dz3o88rdi/image/upload/w_100,q_100/v1581928924/{{ $image->image }}"  />
                    </div>
                    @endforeach
                @endif
                </div>
            </div>
            <div class="statbox widget box box-shadow">
                <div class="widget-content widget-content-area">
                    <div id="circle-basic" class="">
                        <h3>{{ __('messages.product_details') }}</h3>
                        <section>
                            <div class="custom-file-container" data-upload-id="myFirstImage">
                                <label>{{ __('messages.upload') }} ({{ __('messages.multiple_image') }}) * <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a></label>
                                <label class="custom-file-container__custom-file" >
                                    <input type="file" required name="images[]" multiple class="custom-file-container__custom-file__custom-file-input" accept="image/*">
                                    <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
                                    <span class="custom-file-container__custom-file__custom-file-control"></span>
                                </label>
                                <div class="custom-file-container__image-preview"></div>
                            </div>
                            <div class="form-group">
                                <label for="brand">{{ __('messages.brand') }}</label>
                                <select name="brand_id" class="form-control brand">
                                    <option value="0" selected>{{ __('messages.select') }}</option>
                                    @foreach ( $data['brands'] as $brand )
                                    <option {{ isset($data['product']['brand_id']) && $data['product']['brand_id'] == $brand->id ? 'selected' : '' }} value="{{ $brand->id }}">{{ App::isLocale('en') ? $brand->title_en : $brand->title_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="category">{{ __('messages.category') }}</label>
                                <select id="category" name="category_id" class="form-control">
                                    <option disabled selected>{{ __('messages.select') }}</option>
                                    @foreach ( $data['categories'] as $category )
                                    <option {{ $data['product']['category_id'] == $category->id ? 'selected' : '' }} value="{{ $category->id }}">{{ App::isLocale('en') ? $category->title_en : $category->title_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div style="display: none" class="form-group">
                                <label for="sub_category_select">{{ __('messages.sub_category') }}</label>
                                <select id="sub_category_select" name="sub_category_id" class="form-control">
                                </select>
                            </div>
                            <div class="form-group mb-4">
                                <label for="title_en">{{ __('messages.title_en') }}</label>
                                <input required type="text" name="title_en" class="form-control" id="title_en" placeholder="{{ __('messages.title_en') }}" value="{{ $data['product']['title_en'] }}" >
                            </div>
                            <div class="form-group mb-4">
                                <label for="title_ar">{{ __('messages.title_ar') }}</label>
                                <input required type="text" name="title_ar" class="form-control" id="title_ar" placeholder="{{ __('messages.title_ar') }}" value="{{ $data['product']['title_ar'] }}" >
                            </div>
                            <div class="form-group mb-4 english-direction" >
                                <label for="demo1">{{ __('messages.english') }}</label>
                                <textarea required name="description_en" class="form-control"  rows="5">{{ $data['product']['description_en'] }}</textarea>
                            </div>
                
                            <div class="form-group mb-4 arabic-direction">
                                <label for="demo2">{{ __('messages.arabic') }}</label>
                                <textarea name="description_ar" required  class="form-control"  rows="5">{{ $data['product']['description_ar'] }}</textarea>
                            </div> 
                        </section>
                        <h3>{{ __('messages.product_specification') }} ( {{ __('messages.optional') }} )</h3>
                        <section>
                            <div id="category_options" style="margin-bottom: 20px; display : none" class="col-md-3" >
                                <label> {{ __('messages.options') }} </label>
                                <div class="row">
                                    
                                </div>  
                            </div>
                            <div id="category_options_sibling">
                                @if(isset($data['options']) && count($data['options']) > 0)
                                    @for ($i = 0; $i < count($data['options']); $i ++)
                                    @if(App::isLocale('en'))
                                    <div class="form-group mb-4 {{ $data['options'][$i]['option_id'] . "element" }}">
                                        <label>English {{ $data['options'][$i]['option_title_en']  }}</label>
                                        <input required type="text" name="value_en[]" class="form-control"  placeholder="" value="{{ $data['options'][$i]['value_en'] }}" >
                                    </div>
                                    <div class="form-group mb-4 {{ $data['options'][$i]['option_id'] . "element" }}">
                                        <label >English {{ $data['options'][$i]['option_title_en']  }}</label>
                                        <input required type="text" name="value_ar[]" class="form-control" placeholder="" value="{{ $data['options'][$i]['value_ar'] }}" >
                                    </div>
                                    @else
                                    <div class="form-group mb-4 {{ $data['options'][$i]['option_id'] . "element" }}">
                                        <label>{{ $data['options'][$i]['option_title_ar']  }} باللغة العربية</label>
                                        <input required type="text" name="value_en[]" class="form-control"  placeholder="" value="{{ $data['options'][$i]['value_en'] }}" >
                                    </div>
                                    <div class="form-group mb-4 {{ $data['options'][$i]['option_id'] . "element" }}">
                                        <label >{{ $data['options'][$i]['option_title_ar']  }} باللغة العربية</label>
                                        <input required type="text" name="value_ar[]" class="form-control" placeholder="" value="{{ $data['options'][$i]['value_ar'] }}" >
                                    </div>
                                    @endif
                                    <input name="option[]" value="{{ $data['options'][$i]['option_id'] }}" type="hidden" class="new-control-input {{ $data['options'][$i]['option_id'] . "element" }}">
                                    @endfor
                                @endif
                            </div>
                        </section>
                        <h3>{{ __('messages.prices_and_inventory') }}</h3>
                        <section>
                            <div class="form-group mb-4">
                                <label for="total_quatity">{{ __('messages.total_quatity') }}</label>
                                <input required type="number" name="total_quatity" class="form-control" id="total_quatity" placeholder="{{ __('messages.total_quatity') }}" value="{{ $data['product']['total_quatity'] }}" >
                            </div>
                            <div class="form-group mb-4">
                                <label for="remaining_quantity">{{ __('messages.remaining_quantity') }}</label>
                                <input required type="number" name="remaining_quantity" class="form-control" id="remaining_quantity" placeholder="{{ __('messages.remaining_quantity') }}" value="{{ $data['product']['remaining_quantity'] }}" >
                            </div>
                            <div class="form-group mb-4">
                                <label for="price_before_offer">{{ __('messages.product_price') }}</label>
                                <input required type="number" step="any" min="0" name="price_before_offer" class="form-control" id="price_before_offer" placeholder="{{ __('messages.product_price') }}" value="{{ $data['product']['price_before_offer'] != 0 ? $data['product']['price_before_offer'] : $data['product']['final_price'] }}" >
                            </div>
                            <div style="margin-bottom: 20px" class="col-md-3" >
                                <div >
                                   <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
                                     <input {{ $data['product']['offer_percentage'] > 0 ? 'checked' : '' }} id="discount" name="offer" value="1" type="checkbox" class="new-control-input">
                                     <span class="new-control-indicator"></span><span class="new-chk-content">{{ __('messages.discount') }}</span>
                                   </label>
                               </div>     
                            </div>
                            <div style="display:{{ $data['product']['offer_percentage'] == 0 ? 'none' : '' }}" class="form-group mb-4">
                                <label for="offer_percentage">{{ __('messages.discount_value') }}</label>
                                <input {{ $data['product']['offer_percentage'] == 0 ? 'disabled' : '' }} type="number" step="any" min="0" name="offer_percentage" class="form-control" id="offer_percentage" placeholder="{{ __('messages.discount_value') }}" value="{{ $data['product']['offer_percentage'] }}" >
                            </div>
                            <div style="display:{{ $data['product']['offer_percentage'] == 0 ? 'none' : '' }}" class="form-group mb-4">
                                <label for="final_price">{{ __('messages.price_after_discount') }}</label>
                                <input disabled type="number" step="any" min="0" name="final_price" class="form-control" id="final_price" placeholder="{{ __('messages.price_after_discount') }}" value="{{ $data['product']['final_price'] }}" >
                            </div>
                            <div class="form-group mb-4">
                                <label for="stored_number">{{ __('messages.product_stored_number') }}</label>
                                <input type="text" name="stored_number" class="form-control" id="stored_number" placeholder="{{ __('messages.product_stored_number') }}" value="{{ empty($data['product']['stored_number']) ? '' : $data['product']['stored_number'] }}" >
                            </div>
                            <div class="form-group mb-4">
                                <label for="title_en">{{ __('messages.barcode') }}</label>
                                <input required type="text" name="barcode" class="form-control" id="barcode" placeholder="{{ __('messages.barcode') }}" value="{{ empty($data['product']['barcode']) ? $data['barcode'] : $data['product']['barcode'] }}" >
                            </div>
                             @if (count($data['Home_sections']) > 0)
                            <div style="margin-bottom: 20px" class="col-md-3" >
                                <div >
                                <label class="new-control new-checkbox new-checkbox-text checkbox-primary">
                                    <input id="add_home" {{ count($data['elements']) > 0 ? 'checked' : '' }} value="1" type="checkbox" class="new-control-input">
                                    <span class="new-control-indicator"></span><span class="new-chk-content">{{ __('messages.add_product_to_home_section') }}</span>
                                </label>
                            </div>     
                            </div>

                            <div style="display: {{ count($data['elements']) > 0 ? '' : 'none' }}" class="form-group">
                                <label for="home_section">{{ __('messages.home_section') }}</label>
                                <select  id="home_section" name="home_section" class="form-control">
                                    <option value="0" selected>{{ __('messages.select') }}</option>
                                    @foreach ( $data['Home_sections'] as $section )
                                    <option {{(in_array($section->id , $data['elements'])? 'selected' : '')}} value="{{ $section->id }}">{{ App::isLocale('en') ? $section->title_en : $section->title_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @endif 

                        </section>
                    </div>
        
                </div>
            </div>

        </form>
    </div>
@endsection