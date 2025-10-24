/* ==============
 ========= js documentation ==========================

 
 * ==================================================
    
     01. preloader
     -------------------------------------------------
     02. on scroll actions
     -------------------------------------------------
     03. scroll top
     -------------------------------------------------
     04. navbar active color
     -------------------------------------------------
     05. magnificPopup
     -------------------------------------------------
     06. data background
     -------------------------------------------------
     07. reply
     -------------------------------------------------
     07. nav-right__search
     -------------------------------------------------
     08. sidebar_btn
     -------------------------------------------------
     09. faq
     -------------------------------------------------
     10. browse-spaces-filter__tab
     -------------------------------------------------
     11. contact ajax
     -------------------------------------------------
     12. btn_theme
     -------------------------------------------------
     13. price-range
     -------------------------------------------------
     13. calculator_submit
     -------------------------------------------------
     14. copyright year
     -------------------------------------------------
     
    ==================================================
============== */


    jQuery(document).ready(function () {

        // pre_loader
        $(".preloader").delay(300).animate({
            "opacity": "0"
        }, 800, function () {
            $(".preloader").css("display", "none");
        });

        // on scroll actions
        var scroll_offset = 120;
        $(window).scroll(function () {
            var $this = $(window);
            if ($('.header-section').length) {
                if ($this.scrollTop() > scroll_offset) {
                    $('.header-section').addClass('header-active');
                } else {
                    $('.header-section').removeClass('header-active');
                }
            }
        });

        // scroll top
        $(window).scroll(function () {
            if ($(window).scrollTop() > 500) {
                $('.scrollToTop').addClass('topActive');
            }
            else {
                $('.scrollToTop').removeClass('topActive');
            }
        });

        // navbar active color
        $('.navbar-nav .nav-item a').click(function(){
            $('.nav-item a').removeClass("active");
            $(this).addClass("active");
        });

        // // navbar-collapse for landing page
        // jQuery("#offcanvasRight .custom-nevbar__nav>li>").click(function(){
        //     jQuery('#offcanvasRight').offcanvas('hide');
        // });


        // magnificPopup
        $('.popup_img').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            }
        });

        // data background
        $("[data-background]").each(function () {
            $(this).css(
                "background-image",
                "url(" + $(this).attr("data-background") + ")"
            );
        });

        // reply
        $(".reply").on("click", function () {
            $(this).toggleClass("reply-active");
            $(this).parent().next(".reply__content").slideToggle();
        });

        //--View All Content
        // $(".view-btn").on("click", function () {
        //     $(this).toggleClass("view-active");
        //     $(this).parent().next(".view-content-wrap").toggleClass("active");
        // });
        // $(".view-btn").on("click", function () {
        //     $(this).toggleClass("view-active");
        //     $(this).parents().next(".view-content-wrap").toggleClass("active");
        // });
        $(".view-btn").on("click", function () {
            $(this).toggleClass("view-active");
            $(this).parents().next(".view-content-wrap").toggleClass("active").slideToggle();
        });
        
        

        // nav-right__search
        $(".nav-right__search-icon").on("click", function () {
            $(this).toggleClass("active");
            $(this).parent().next(".nav-right__search-inner").slideToggle();
        });

        // sidebar_btn
        $(".sidebar_btn").on("click", function () {
            $('.cus_scrollbar').toggleClass("show");
        });

        // faq
        // $(".accordion-header").on("click", function () {
        //     $('.accordion-item').removeClass("accordion_bg");
        //     $(this).parent().closest('.accordion-item').toggleClass("accordion_bg");
        // });

        $(".accordion-header").on("click", function () {
    $(".accordion-item").removeClass("accordion_bg");
    $(this).closest(".accordion-item").addClass("accordion_bg");
});

        // browse-spaces-filter__tab
        $('#browse-spaces-filter__tab li a').on("click", function () {
            // fetch the class of the clicked item
            var ourClass = $(this).attr('class');

            // reset the active class on all the buttons
            $('#browse-spaces-filter__tab li').removeClass('active');
            // update the active state on our clicked button
            $(this).parent().addClass('active');

            if (ourClass == 'all') {
                // show all our items
                $('#browse-spaces-filter__content').children('div.item').show();
            } else {
                // hide all elements that don't share ourClass
                $('#browse-spaces-filter__content').children('div:not(.' + ourClass + ')').hide();
                // show all elements that do share ourClass
                $('#browse-spaces-filter__content').children('div.' + ourClass).show();
            }
            return false;
        });


        // contact form
        // ajax
        // jQuery('#frmContactus').on('submit', function (e) {
        //     jQuery('#msg').html('');
        //     jQuery('#submit').html('Please wait....');
        //     jQuery('#submit').attr('disabled', true);
        //     jQuery.ajax({
        //         url: 'mail.php',
        //         type: 'POST',
        //         data: jQuery('#frmContactus').serialize(),
        //         success: function (result) {
        //             jQuery('#msg').html(result);
        //             jQuery('#submit').html('Send Message');
        //             jQuery('#submit').attr('disabled', false);
        //             jQuery('#frmContactus')[0].reset();

        //             setTimeout(function () {
        //                 $('.alert-dismissible').fadeOut('slow', function () {
        //                     $(this).remove();
        //                 });
        //             }, 3000);
        //         }
        //     });
        //     e.preventDefault();
        // });

        // Email Subscribe
        jQuery('#frmSubscribe').on('submit', function (e) {
            var emailSubscribe = jQuery("input[name='sMail']").val();
            jQuery('#subscribeMsg').html('');
            jQuery('#emailSubscribe').html('Please wait....');
            jQuery('#emailSubscribe').attr('disabled', true);
            jQuery.ajax({
                url: 'mail.php',
                type: 'POST',
                data: {
                    'subscribes': '',
                    'emailSubscribe': emailSubscribe
                },
                success: function (result) {
                    jQuery('#subscribeMsg').html(result);
                    jQuery('#emailSubscribe').html('Subscribe');
                    jQuery('#emailSubscribe').attr('disabled', false);
                    jQuery('#frmSubscribe')[0].reset();

                    setTimeout(function () {
                        $('.alert-dismissible').fadeOut('slow', function () {
                            $(this).remove();
                        });
                    }, 3000);
                }
            });
            e.preventDefault();
        });


        // dropFiles
        // $("#dropFiles").on('dragenter', function (ev) {
        //     // Entering drop area. Highlight area
        //     $("#dropFiles").addClass("highlightDropArea");
        // });

        // $("#dropFiles").on('dragleave', function (ev) {
        //     // Going out of drop area. Remove Highlight
        //     $("#dropFiles").removeClass("highlightDropArea");
        // });

        // $("#dropFiles").on('drop', function (ev) {
        //     // Dropping files
        //     ev.preventDefault();
        //     ev.stopPropagation();
        //     // Clear previous messages
        //     $("#messages").empty();
        //     if (ev.originalEvent.dataTransfer) {
        //         if (ev.originalEvent.dataTransfer.files.length) {
        //             var droppedFiles = ev.originalEvent.dataTransfer.files;
        //             for (var i = 0; i < droppedFiles.length; i++) {
        //                 console.log(droppedFiles[i]);
        //                 $("#messages").append("<br /> <b>Dropped File </b>" + droppedFiles[i].name);
        //                 // Upload droppedFiles[i] to server
        //             }
        //         }
        //     }

        //     $("#dropFiles").removeClass("highlightDropArea");
        //     return false;
        // });

        // $("#dropFiles").on('dragover', function (ev) {
        //     ev.preventDefault();
        // });

        // copyright year
        $("#copyYear").text(new Date().getFullYear());

    });

    // btn_theme
    $(function() {  
        $('.btn_theme')
          .on('mouseenter', function(e) {
                  var parentOffset = $(this).offset(),
                    relX = e.pageX - parentOffset.left,
                    relY = e.pageY - parentOffset.top;
                  $(this).find('span').css({top:relY, left:relX})
          })
          .on('mouseout', function(e) {
                  var parentOffset = $(this).offset(),
                    relX = e.pageX - parentOffset.left,
                    relY = e.pageY - parentOffset.top;
              $(this).find('span').css({top:relY, left:relX})
          });
    });
    
    // Function to handle multiple sliders
    // function RangeSlider(sliderOneId, sliderTwoId, minValId, maxValId, totalOutputId, sliderTrackSelector) {
    //     // Get DOM elements
    //     let sliderOne = document.getElementById(sliderOneId);
    //     let sliderTwo = document.getElementById(sliderTwoId);
    //     let displayValOne = document.getElementById(minValId);
    //     let displayValTwo = document.getElementById(maxValId);
    //     let totalOutput = document.getElementById(totalOutputId);
    //     let sliderTrack = document.querySelector(sliderTrackSelector);
    //     let minGap = 0;
    //     let sliderMaxValue = sliderOne.max;

    //     // Update first slider value
    //     function slideOne() {
    //         if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
    //             sliderOne.value = parseInt(sliderTwo.value) - minGap;
    //         }
    //         displayValOne.textContent = sliderOne.value;
    //         updateTotal();  // Update the total range after slider change
    //         fillColor();  // Update slider track color
    //     }

    //     // Update second slider value
    //     function slideTwo() {
    //         if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
    //             sliderTwo.value = parseInt(sliderOne.value) + minGap;
    //         }
    //         displayValTwo.textContent = sliderTwo.value;
    //         updateTotal();  // Update the total range after slider change
    //         fillColor();  // Update slider track color
    //     }

    //     // Update the total price range and display it
    //     function updateTotal() {
    //         let total = sliderTwo.value - sliderOne.value;
    //         totalOutput.textContent = `Years: ${total}`;
    //     }

    //     // Update slider track background color
    //     function fillColor() {
    //         let percent1 = (sliderOne.value / sliderMaxValue) * 100;
    //         let percent2 = (sliderTwo.value / sliderMaxValue) * 100;
    //         sliderTrack.style.background = `linear-gradient(to right, #dadae5 ${percent1}% , #074C3E ${percent1}% , #074C3E ${percent2}%, #dadae5 ${percent2}%)`;
    //     }

    //     // Attach event listeners for the sliders
    //     sliderOne.addEventListener('input', slideOne);
    //     sliderTwo.addEventListener('input', slideTwo);

    //     // Initialize the slider on load
    //     slideOne(); 
    //     slideTwo();
    // }

    // // Initialize all sliders on the page
    // window.addEventListener('DOMContentLoaded', function () {
    //     // Example initialization for one slider instance
    //     new RangeSlider('range-slider-1', 'range-slider-2', 'min-value', 'max-value', 'range-output', '.slider-track');

    //     // If you have more sliders, you can initialize them the same way with different IDs
    //     new RangeSlider('range-slider-3', 'range-slider-4', 'min-value-2', 'max-value-2', 'range-output-2', '.slider-track-2');
    // });
    
    // // calculator_submit
    // $("#calc_submit").on("click", function () {
    //     $(".calc").addClass("calc_hide");
    //     $(".calculator-result").addClass("calc_show");
    // });
    
    // // Calculator
    // // loan1
    // const amount = document.getElementById('amount'),
    // interest = document.getElementById('interest'),
    // year = document.getElementById('year'),
    // monthly_cost = document.getElementById('monthly_cost'),
    // calculate = document.getElementById('calc_submit'),
    // total_value = document.getElementById('total_value');

    // // loan2
    // const amount2 = document.getElementById('amount2'),
    // interest2 = document.getElementById('interest2'),
    // year2 = document.getElementById('year2'),
    // monthly_cost2 = document.getElementById('monthly_cost2'),
    // calculate2 = document.getElementById('calc_submit2'),
    // total_value2 = document.getElementById('total_value2');
    
    // if(calculate){ 
    //     calculate.addEventListener('click', function(e){
    //         e.preventDefault()
    //         let total = (amount.value/100 * interest.value) + parseInt(amount.value)
    //         total_value.innerHTML = total.toFixed(2)
    //         monthly_cost.innerHTML = (total/(year.value*12)).toFixed(2)
        
    //         // loan2
    //         let total2 = (amount2.value/100 * interest2.value) + parseInt(amount2.value)
    //         total_value2.innerHTML = total2.toFixed(2)
    //         monthly_cost2.innerHTML = (total2/(year2.value*12)).toFixed(2)
    //     })
    // }

   
    (function () {
        // Function to handle multiple sliders
        function RangeSlider(sliderOneId, sliderTwoId, minValId, maxValId, totalOutputId, sliderTrackSelector) {
            // Get DOM elements
            let sliderOne = document.getElementById(sliderOneId);
            let sliderTwo = document.getElementById(sliderTwoId);
            let displayValOne = document.getElementById(minValId);
            let displayValTwo = document.getElementById(maxValId);
            let totalOutput = document.getElementById(totalOutputId);
            let sliderTrack = document.querySelector(sliderTrackSelector);
            let minGap = 0;
            let sliderMaxValue = sliderOne.max;
    
            // Update first slider value
            function slideOne() {
                if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
                    sliderOne.value = parseInt(sliderTwo.value) - minGap;
                }
                displayValOne.textContent = sliderOne.value;
                updateTotal();  // Update the total range after slider change
                fillColor();  // Update slider track color
            }
    
            // Update second slider value
            function slideTwo() {
                if (parseInt(sliderTwo.value) - parseInt(sliderOne.value) <= minGap) {
                    sliderTwo.value = parseInt(sliderOne.value) + minGap;
                }
                displayValTwo.textContent = sliderTwo.value;
                updateTotal();  // Update the total range after slider change
                fillColor();  // Update slider track color
            }
    
            // Update the total price range and display it
            function updateTotal() {
                let total = sliderTwo.value - sliderOne.value;
                totalOutput.textContent = `Years: ${total}`;
            }
    
            // Update slider track background color
            function fillColor() {
                let percent1 = (sliderOne.value / sliderMaxValue) * 100;
                let percent2 = (sliderTwo.value / sliderMaxValue) * 100;
                sliderTrack.style.background = `linear-gradient(to right, #dadae5 ${percent1}% , #074C3E ${percent1}% , #074C3E ${percent2}%, #dadae5 ${percent2}%)`;
            }
    
            // Attach event listeners for the sliders
            sliderOne.addEventListener('input', slideOne);
            sliderTwo.addEventListener('input', slideTwo);
    
            // Initialize the slider on load
            slideOne();
            slideTwo();
        }
    
        // Initialize all sliders on the page
        window.addEventListener('DOMContentLoaded', function () {
            // Initialize sliders only if elements exist
            if (document.getElementById('range-slider-1') && document.getElementById('range-slider-2')) {
                new RangeSlider('range-slider-1', 'range-slider-2', 'min-value', 'max-value', 'range-output', '.slider-track');
            }
    
            if (document.getElementById('range-slider-3') && document.getElementById('range-slider-4')) {
                new RangeSlider('range-slider-3', 'range-slider-4', 'min-value-2', 'max-value-2', 'range-output-2', '.slider-track-2');
            }
        });
    
        // Calculator logic, checking if elements exist
        const amount = document.getElementById('amount'),
            interest = document.getElementById('interest'),
            year = document.getElementById('year'),
            monthly_cost = document.getElementById('monthly_cost'),
            calculate = document.getElementById('calc_submit'),
            total_value = document.getElementById('total_value');
    
        const amount2 = document.getElementById('amount2'),
            interest2 = document.getElementById('interest2'),
            year2 = document.getElementById('year2'),
            monthly_cost2 = document.getElementById('monthly_cost2'),
            calculate2 = document.getElementById('calc_submit2'),
            total_value2 = document.getElementById('total_value2');
    
        if (calculate) {
            calculate.addEventListener('click', function (e) {
                e.preventDefault();
                // Loan 1 calculations
                if (amount && interest && year) {
                    let total = (amount.value / 100 * interest.value) + parseInt(amount.value);
                    total_value.innerHTML = total.toFixed(2);
                    monthly_cost.innerHTML = (total / (year.value * 12)).toFixed(2);
                }
    
                // Loan 2 calculations
                if (amount2 && interest2 && year2) {
                    let total2 = (amount2.value / 100 * interest2.value) + parseInt(amount2.value);
                    total_value2.innerHTML = total2.toFixed(2);
                    monthly_cost2.innerHTML = (total2 / (year2.value * 12)).toFixed(2);
                }
            });
        }
    
        // Additional event listener for second calculator (if applicable)
        if (calculate2) {
            calculate2.addEventListener('click', function (e) {
                e.preventDefault();
                // Loan 2 calculations
                if (amount2 && interest2 && year2) {
                    let total2 = (amount2.value / 100 * interest2.value) + parseInt(amount2.value);
                    total_value2.innerHTML = total2.toFixed(2);
                    monthly_cost2.innerHTML = (total2 / (year2.value * 12)).toFixed(2);
                }
            });
        }
    })();
    
