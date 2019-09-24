package ASK

Skill :: {
	Type: "Alexa::ASK::Skill"
	Properties: {
		AuthenticationConfiguration: __AuthenticationConfiguration
		SkillPackage:                __SkillPackage
		VendorId:                    string
	}
	__AuthenticationConfiguration :: {
		ClientId:     string
		ClientSecret: string
		RefreshToken: string
	}
	__Overrides :: {
		Manifest?: {
		}
	}
	__SkillPackage :: {
		Overrides?:       __Overrides
		S3Bucket:         string
		S3BucketRole?:    string
		S3Key:            string
		S3ObjectVersion?: string
	}
}
