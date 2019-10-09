package ASK

import "github.com/TangoGroup/fn"

Skill :: {
	Type: "Alexa::ASK::Skill"
	Properties: {
		AuthenticationConfiguration: __AuthenticationConfiguration
		SkillPackage:                __SkillPackage
		VendorId:                    string | fn.Fn
	}
	__AuthenticationConfiguration :: {
		ClientId:     string | fn.Fn
		ClientSecret: string | fn.Fn
		RefreshToken: string | fn.Fn
	}
	__Overrides :: {
		Manifest?: {
		} | fn.Fn
	}
	__SkillPackage :: {
		Overrides?:       __Overrides
		S3Bucket:         string | fn.Fn
		S3BucketRole?:    string | fn.Fn
		S3Key:            string | fn.Fn
		S3ObjectVersion?: string | fn.Fn
	}
}
