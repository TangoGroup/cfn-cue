package fn

// import "github.com/TangoGroup/aws/fn"

import aws "github.com/TangoGroup/aws/uswest2"

template: aws.#Template
template: {
	// Resources: S3Bucket1: aws.S3.Bucket
	Resources: S3Bucket1: {
		Type: "AWS::S3::Bucket"
		Properties: BucketName: "the-bucket"
		Properties: AccessControl: Ref: "S3AccessControl"
		// Properties: AccessControl: "AuthenticatedRead"
	}
	// Resources: EC2Instance: aws.EC2.Instance
	Resources: EC2Instance: {
		Type: "AWS::EC2::Instance"
		Properties: {
			// Leander: "Is cute as a button"
			InstanceType: Ref: "InstanceType"
			ImageId: Ref:      "LatestAmiId"
		}
	}
	// for resourceName, resource in Resources {
	// 	Resources: "\(resourceName)": aws.ResourceTypesMap[resource.Type]
	// }
}
