$('#entry_picture').bind('change', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  var img_upload= $('.imgUpload');
  if (size_in_megabytes > 5) {
    alert(I18n.t('shared.micropost_form.alert'));
  }
  else{
    img_upload.src=this.files[0].mozFullPath;
  }
});
