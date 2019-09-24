package GuardDuty

Detector :: {
	Type: "AWS::GuardDuty::Detector"
	Properties: {
		Enable:                      bool
		FindingPublishingFrequency?: "FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS"
		FindingPublishingFrequency?: string
	}
}
Filter :: {
	Type: "AWS::GuardDuty::Filter"
	Properties: {
		Action:          "ARCHIVE" | "NOOP"
		Action:          string
		Description:     string
		DetectorId:      string
		FindingCriteria: __FindingCriteria
		Name?:           string
		Rank:            int
	}
	__Condition :: {
		Eq?: [...string]
		Gte?: int
		Lt?:  int
		Lte?: int
		Neq?: [...string]
	}
	__FindingCriteria :: {
		Criterion?: {
		}
		ItemType?: __Condition
	}
}
IPSet :: {
	Type: "AWS::GuardDuty::IPSet"
	Properties: {
		Activate:   bool
		DetectorId: string
		Format:     "OTX_CSV" | "STIX" | "TXT"
		Format:     string
		Location:   string
		Name?:      string
	}
}
Master :: {
	Type: "AWS::GuardDuty::Master"
	Properties: {
		DetectorId:    string
		InvitationId?: string
		MasterId:      string
	}
}
Member :: {
	Type: "AWS::GuardDuty::Member"
	Properties: {
		DetectorId:                string
		DisableEmailNotification?: bool
		Email:                     string
		MemberId:                  string
		Message?:                  string
		Status?:                   "Created" | "Disabled" | "Enabled" | "Invited" | "Removed" | "Resigned"
		Status?:                   string
	}
}
ThreatIntelSet :: {
	Type: "AWS::GuardDuty::ThreatIntelSet"
	Properties: {
		Activate:   bool
		DetectorId: string
		Format:     "ALIEN_VAULT" | "FIRE_EYE" | "OTX_CSV" | "PROOF_POINT" | "STIX" | "TXT"
		Format:     string
		Location:   string
		Name?:      string
	}
}
