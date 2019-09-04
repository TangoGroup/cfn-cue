package GuardDuty

Detector :: {
  Type: "AWS::GuardDuty::Detector"
  Properties: {
    Enable:                      bool
    FindingPublishingFrequency?: string
  }
}
Filter :: {
  Type: "AWS::GuardDuty::Filter"
  Properties: {
    Action:          string
    Description:     string
    DetectorId:      string
    FindingCriteria: __FindingCriteria
    Name?:           string
    Rank:            int
  }
  __Condition = {
    Eq?: [...string]
    Gte?: int
    Lt?:  int
    Lte?: int
    Neq?: [...string]
  }
  __FindingCriteria = {
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
    Status?:                   string
  }
}
ThreatIntelSet :: {
  Type: "AWS::GuardDuty::ThreatIntelSet"
  Properties: {
    Activate:   bool
    DetectorId: string
    Format:     string
    Location:   string
    Name?:      string
  }
}
