package uswest2

import "github.com/TangoGroup/fn"

GuardDuty :: {
	Detector :: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			Enable:                      bool | fn.Fn
			FindingPublishingFrequency?: (string & ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS")) | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	Filter :: {
		Type: "AWS::GuardDuty::Filter"
		Properties: {
			Action:      (string & ("ARCHIVE" | "NOOP")) | fn.Fn
			Description: string | fn.Fn
			DetectorId:  string | fn.Fn
			FindingCriteria: {
				Criterion?: {
					[string]: _
				} | fn.Fn
				ItemType?: {
					Eq?: [...(string | fn.Fn)]
					Gte?: int | fn.Fn
					Lt?:  int | fn.Fn
					Lte?: int | fn.Fn
					Neq?: [...(string | fn.Fn)]
				}
			}
			Name?: string | fn.Fn
			Rank:  int | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	IPSet :: {
		Type: "AWS::GuardDuty::IPSet"
		Properties: {
			Activate:   bool | fn.Fn
			DetectorId: string | fn.Fn
			Format:     (string & ("OTX_CSV" | "STIX" | "TXT")) | fn.Fn
			Location:   string | fn.Fn
			Name?:      string | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	Master :: {
		Type: "AWS::GuardDuty::Master"
		Properties: {
			DetectorId:    string | fn.Fn
			InvitationId?: string | fn.Fn
			MasterId:      string | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	Member :: {
		Type: "AWS::GuardDuty::Member"
		Properties: {
			DetectorId:                string | fn.Fn
			DisableEmailNotification?: bool | fn.Fn
			Email:                     string | fn.Fn
			MemberId:                  string | fn.Fn
			Message?:                  string | fn.Fn
			Status?:                   (string & ("Created" | "Disabled" | "Enabled" | "Invited" | "Removed" | "Resigned")) | fn.Fn
		}
		DependsOn?: string | [...string]
	}
	ThreatIntelSet :: {
		Type: "AWS::GuardDuty::ThreatIntelSet"
		Properties: {
			Activate:   bool | fn.Fn
			DetectorId: string | fn.Fn
			Format:     (string & ("ALIEN_VAULT" | "FIRE_EYE" | "OTX_CSV" | "PROOF_POINT" | "STIX" | "TXT")) | fn.Fn
			Location:   string | fn.Fn
			Name?:      string | fn.Fn
		}
		DependsOn?: string | [...string]
	}
}
