package euwest3

import "github.com/TangoGroup/fn"

GuardDuty :: {
	Detector :: {
		Type: "AWS::GuardDuty::Detector"
		Properties: {
			Enable:                      bool | fn.Fn
			FindingPublishingFrequency?: (string & ("FIFTEEN_MINUTES" | "ONE_HOUR" | "SIX_HOURS")) | fn.Fn
		}
	}
}
