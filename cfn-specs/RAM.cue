package RAM

ResourceShare :: {
  Type: "AWS::RAM::ResourceShare"
  Properties: {
    AllowExternalPrincipals?: bool
    Name:                     string
    Principals?: [...string]
    ResourceArns?: [...string]
    Tags?: [...__Tag]
  }
}
