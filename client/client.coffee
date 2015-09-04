Session.setDefault('uploadProgress', 0 )
Session.setDefault('upload_images', [])

Template.showPictures.helpers
  upload_images: () ->
    Session.get('upload_images')

Template.showPicture.helpers
  progress: () ->
    Session.get('uploadProgress')

Template.uploaderTemplate.events
  'change #upload_files_btn': (event, template) ->
      Session.set('uploadProgress', 0)
      Session.set('upload_images', [])
      files = $('#upload_files_btn').get(0).files
      if files.length > 0
        total_files = files.length
        uploads = _.map(files, (file) ->
          uploader = new Slingshot.Upload('aws-s3-example')
          uploader.send(file, (err, fileUrl)->
            console.log("file successfully added " +  fileUrl)
          )
        )
      uploadTracker = Tracker.autorun((computation) ->
        image_array = []
        overall_progress = 0

        _.each(uploads, (upload) ->
          prog = upload.progress()
          if !isNaN prog
            prog = Math.round prog*100
          else
            prog = 0
          console.log prog
          image_details =
            url: upload.url true
            progress: prog

          image_array.push image_details
          overall_progress = overall_progress + prog
          console.log overall_progress

        )
        overall_progress = overall_progress/total_files
        Session.set('upload_images', image_array)

        if !isNaN(overall_progress)
          Session.set 'uploadProgress', Math.round(overall_progress)
        if overall_progress == 100
          computation.stop()
      )
