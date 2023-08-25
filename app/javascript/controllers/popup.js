$(document).ready(function() {

  $("#triggerUpload").click(function () {
      $("#manual-fine-uploader").fineUploader('uploadStoredFiles');
  });

  function submitForm () {
      if ($(this).fineUploader('getInProgress') == 0) {
          var failedUploads = $(this).fineUploader('getUploads',
              { status: qq.status.UPLOAD_FAILED });
          if (failedUploads.length == 0) {
              // do any other form processing here
              $("#uploader").submit();
          }
      }
  };

  // Instantiate a Fine Uploader instance:
  $("#manual-fine-uploader").fineUploader({
      autoUpload: false,
      request: {
          endpoint: "/uploads_bucket"
      }
  }).on("complete", function (event, id, name, response) {
      submitForm.call(this);
  }).on('statusChange', function (event, id, oldStatus, newStatus) {
      if (newStatus === qq.status.CANCELED) {
          submitForm.call(this);
      }
  });
});
