package apeast1

import "github.com/TangoGroup/fn"

GuardDuty :: {
	Detector :: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			Enable:                      bool | fn.Fn
			FindingPublishingFrequency?: string | fn.Fn
		}
	}
	Filter :: {
		Type: "AWS::GuardDuty::Filter"
		Properties: {
			Action:      string | fn.Fn
			Description: string | fn.Fn
			DetectorId:  string | fn.Fn
			FindingCriteria: {
			}
			Name?: string | fn.Fn
			Rank:  int | fn.Fn
		}
	}
	IPSet :: {
		Type: "AWS::GuardDuty::IPSet"
		Properties: {
			Activate:   bool | fn.Fn
			DetectorId: string | fn.Fn
			Format:     string | fn.Fn
			Location:   string | fn.Fn
			Name?:      string | fn.Fn
		}
	}
	Master :: {
		Type: "AWS::GuardDuty::Master"
		Properties: {
			DetectorId:    string | fn.Fn
			InvitationId?: string | fn.Fn
			MasterId:      string | fn.Fn
		}
	}
	Member :: {
		Type: "AWS::GuardDuty::Member"
		Properties: {
			DetectorId:                string | fn.Fn
			DisableEmailNotification?: bool | fn.Fn
			Email:                     string | fn.Fn
			MemberId:                  string | fn.Fn
			Message?:                  string | fn.Fn
			Status?:                   string | fn.Fn
		}
	}
	ThreatIntelSet :: {
		Type: "AWS::GuardDuty::ThreatIntelSet"
		Properties: {
			Activate:   bool | fn.Fn
			DetectorId: string | fn.Fn
			Format:     string | fn.Fn
			Location:   string | fn.Fn
			Name?:      string | fn.Fn
		}
	}
}
