import aws "github.com/TangoGroup/aws/uswest2"

template: aws.#Template & {
	Resources: S3Bucket1: aws.#S3.#Bucket & {
		Type: "AWS::S3::Bucket"
		Properties: BucketName: "the-bucket"
		Properties: AccessControl: Ref: "S3AccessControl"
	}
	Resources: EC2Instance: aws.#EC2.#Instance & {
		Type: "AWS::EC2::Instance"
		Properties: {
			InstanceType: Ref: "InstanceType"
			ImageId: Ref:      "LatestAmiId"
		}
	}
}
