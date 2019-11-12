package cnnorthwest1

import "github.com/TangoGroup/fn"

CloudFront :: {
	CloudFrontOriginAccessIdentity :: {
		Type: "AWS::CloudFront::CloudFrontOriginAccessIdentity"
		Properties: CloudFrontOriginAccessIdentityConfig: {
		}
	}
	Distribution :: {
		Type: "AWS::CloudFront::Distribution"
		Properties: {
			DistributionConfig: {
			}
			Tags?: [...{
			}]
		}
	}
	StreamingDistribution :: {
		Type: "AWS::CloudFront::StreamingDistribution"
		Properties: {
			StreamingDistributionConfig: {
			}
			Tags: [...{
			}]
		}
	}
}
