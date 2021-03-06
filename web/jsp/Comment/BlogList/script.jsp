<%--
  Created by IntelliJ IDEA.
  User: lovesyxfuffy
  Date: 2016/6/7
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${ctx}/resources/comment/jquery-2.1.1.js"></script>
<script src="${ctx}/resources/comment/jquery-ui-1.10.4.min.js"></script>
<script src="${ctx}/resources/comment/bootstrap.min.js"></script>
<!-- 手风琴菜单 -->
<script src="${ctx}/resources/comment/jquery.metisMenu.js"></script>
<!-- 滚动条 -->
<script src="${ctx}/resources/comment/jquery.slimscroll.min.js"></script>
<!-- 导航菜单 -->
<script src="${ctx}/resources/comment/inspinia.js"></script>
<!-- 进度条 -->
<script src="${ctx}/resources/comment/pace.min.js"></script>

<script src="${ctx}/resources/js/jquery-ui.custom.js"></script>
<script src="${ctx}/resources/js/jquery.ui.touch-punch.js"></script>

<script src="${ctx}/resources/js/markdown/bootstrap-markdown.js"></script>
<script src="${ctx}/resources/js/jquery.hotkeys.js"></script>
<script src="${ctx}/resources/js/bootstrap-wysiwyg.js"></script>
<script src="${ctx}/resources/js/bootbox.js"></script>

<script>
    var s_url=window.location.pathname;
    var now_url = '';
    for(var i = 0;i<$("#side-menu li").length;i++){
        now_url=$("#side-menu li a").eq(i).attr("href");
        if(now_url == s_url){
            $("#side-menu a").eq(i).parent().addClass("active");
            $("#side-menu a").eq(i).parent().parent().parent().addClass("active");
            $("#side-menu a").eq(i).parent().parent().addClass("in");
        }else{
            $("#side-menu a").eq(i).parent().removeClass("active");
        }
    }
</script>
<script>
    $('.carousel').carousel({
        interval: 2000
    })
</script>
<script type="text/javascript">
    jQuery(function($){

        $('textarea[data-provide="markdown"]').each(function(){
            var $this = $(this);

            if ($this.data('markdown')) {
                $this.data('markdown').showEditor();
            }
            else $this.markdown()

            $this.parent().find('.btn').addClass('btn-white');
        })



        function showErrorAlert (reason, detail) {
            var msg='';
            if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
            else {
                //console.log("error uploading file", reason, detail);
            }
            $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+
                    '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
        }

        //$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons

        //but we want to change a few buttons colors for the third style
        $('#editor1').ace_wysiwyg({
            toolbar:
                    [
                        'font',
                        null,
                        'fontSize',
                        null,
                        {name:'bold', className:'btn-info'},
                        {name:'italic', className:'btn-info'},
                        {name:'strikethrough', className:'btn-info'},
                        {name:'underline', className:'btn-info'},
                        null,
                        {name:'insertunorderedlist', className:'btn-success'},
                        {name:'insertorderedlist', className:'btn-success'},
                        {name:'outdent', className:'btn-purple'},
                        {name:'indent', className:'btn-purple'},
                        null,
                        {name:'justifyleft', className:'btn-primary'},
                        {name:'justifycenter', className:'btn-primary'},
                        {name:'justifyright', className:'btn-primary'},
                        {name:'justifyfull', className:'btn-inverse'},
                        null,
                        {name:'createLink', className:'btn-pink'},
                        {name:'unlink', className:'btn-pink'},
                        null,
                        {name:'insertImage', className:'btn-success'},
                        null,
                        'foreColor',
                        null,
                        {name:'undo', className:'btn-grey'},
                        {name:'redo', className:'btn-grey'}
                    ],
            'wysiwyg': {
                fileUploadError: showErrorAlert
            }
        }).prev().addClass('wysiwyg-style2');


        /**
         //make the editor have all the available height
         $(window).on('resize.editor', function() {
		var offset = $('#editor1').parent().offset();
		var winHeight =  $(this).height();

		$('#editor1').css({'height':winHeight - offset.top - 10, 'max-height': 'none'});
	}).triggerHandler('resize.editor');
         */


        $('#editor2').css({'height':'200px'}).ace_wysiwyg({
            toolbar_place: function(toolbar) {
                return $(this).closest('.widget-box')
                        .find('.widget-header').prepend(toolbar)
                        .find('.wysiwyg-toolbar').addClass('inline');
            },
            toolbar:
                    [
                        'bold',
                        {name:'italic' , title:'Change Title!', icon: 'ace-icon fa fa-leaf'},
                        'strikethrough',
                        null,
                        'insertunorderedlist',
                        'insertorderedlist',
                        null,
                        'justifyleft',
                        'justifycenter',
                        'justifyright'
                    ],
            speech_button: false
        });




        $('[data-toggle="buttons"] .btn').on('click', function(e){
            var target = $(this).find('input[type=radio]');
            var which = parseInt(target.val());
            var toolbar = $('#editor1').prev().get(0);
            if(which >= 1 && which <= 4) {
                toolbar.className = toolbar.className.replace(/wysiwyg\-style(1|2)/g , '');
                if(which == 1) $(toolbar).addClass('wysiwyg-style1');
                else if(which == 2) $(toolbar).addClass('wysiwyg-style2');
                if(which == 4) {
                    $(toolbar).find('.btn-group > .btn').addClass('btn-white btn-round');
                } else $(toolbar).find('.btn-group > .btn-white').removeClass('btn-white btn-round');
            }
        });




        //RESIZE IMAGE

        //Add Image Resize Functionality to Chrome and Safari
        //webkit browsers don't have image resize functionality when content is editable
        //so let's add something using jQuery UI resizable
        //another option would be opening a dialog for user to enter dimensions.
        if ( typeof jQuery.ui !== 'undefined' && ace.vars['webkit'] ) {

            var lastResizableImg = null;
            function destroyResizable() {
                if(lastResizableImg == null) return;
                lastResizableImg.resizable( "destroy" );
                lastResizableImg.removeData('resizable');
                lastResizableImg = null;
            }

            var enableImageResize = function() {
                $('.wysiwyg-editor')
                        .on('mousedown', function(e) {
                            var target = $(e.target);
                            if( e.target instanceof HTMLImageElement ) {
                                if( !target.data('resizable') ) {
                                    target.resizable({
                                        aspectRatio: e.target.width / e.target.height,
                                    });
                                    target.data('resizable', true);

                                    if( lastResizableImg != null ) {
                                        //disable previous resizable image
                                        lastResizableImg.resizable( "destroy" );
                                        lastResizableImg.removeData('resizable');
                                    }
                                    lastResizableImg = target;
                                }
                            }
                        })
                        .on('click', function(e) {
                            if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {
                                destroyResizable();
                            }
                        })
                        .on('keydown', function() {
                            destroyResizable();
                        });
            }

            enableImageResize();

            /**
             //or we can load the jQuery UI dynamically only if needed
             if (typeof jQuery.ui !== 'undefined') enableImageResize();
             else {//load jQuery UI if not loaded
			//in Ace demo ../assets will be replaced by correct assets path
			$.getScript("../assets/js/jquery-ui.custom.min.js", function(data, textStatus, jqxhr) {
				enableImageResize()
			});
		}
             */
        }


    });
</script>
<script>
    $("#list-5").addClass("active open")
    $("#list-5-1").addClass("active")
</script>