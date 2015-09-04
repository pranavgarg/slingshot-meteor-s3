Slingshot.createDirective("aws-s3-example", Slingshot.S3Storage,
  bucket: Meteor.settings.server.MY_BUCKET,
  acl: "public-read",
  AWSAccessKeyId: Meteor.settings.server.AWS_ACCESS_KEY,
  AWSSecretAccessKey: Meteor.settings.server.AWS_SECRET_KEY,
  authorize: () ->
    if (!this.userId)
      message = "Please login before posting files"
      throw new Meteor.Error("Login Required", message)

    return true
  maxSize: Meteor.settings.server.MAX_SIZE,
  allowedFileTypes: ["image/png", "image/jpeg", "image/gif", "application/pdf"],
  key: (file) ->
    Meteor.userId() + "/" + file.name
)