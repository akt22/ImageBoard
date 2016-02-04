$('.js-csv-upload').fileinput
  showPreview: false
  maxFileCount: 1
  browseClass: 'btn btn-info fileinput-browse-button'
  browseIcon: ''
  browseLabel: ' ファイル選択'
  removeClass: 'btn btn-warning'
  removeIcon: ''
  removeLabel: ' キャンセル'
  uploadClass: 'btn btn-success fileinput-upload-button'
  uploadIcon: '<i class="fa fa-upload"></i>'
  uploadLabel: ' インポート'
  allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif']
  msgValidationError: '''
    <span class="text-danger">
      <i class="fa fa-warning"></i> 画像ファイルのみ有効です。
    </span>
  '''