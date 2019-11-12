package saeast1

import "github.com/TangoGroup/fn"

DAX :: {
	Cluster :: {
		Type: "AWS::DAX::Cluster"
		Properties: {
			AvailabilityZones?: [...(string | fn.Fn)]
			ClusterName?:                string | fn.Fn
			Description?:                string | fn.Fn
			IAMRoleARN:                  string | fn.Fn
			NodeType:                    string | fn.Fn
			NotificationTopicARN?:       string | fn.Fn
			ParameterGroupName?:         string | fn.Fn
			PreferredMaintenanceWindow?: string | fn.Fn
			ReplicationFactor:           int | fn.Fn
			SSESpecification?: {
			}
			SecurityGroupIds?: [...(string | fn.Fn)]
			SubnetGroupName?: string | fn.Fn
			Tags?:            {
				[string]: _
			} | fn.Fn
		}
	}
	ParameterGroup :: {
		Type: "AWS::DAX::ParameterGroup"
		Properties: {
			Description?:         string | fn.Fn
			ParameterGroupName?:  string | fn.Fn
			ParameterNameValues?: {
				[string]: _
			} | fn.Fn
		}
	}
	SubnetGroup :: {
		Type: "AWS::DAX::SubnetGroup"
		Properties: {
			Description?:     string | fn.Fn
			SubnetGroupName?: string | fn.Fn
			SubnetIds: [...(string | fn.Fn)]
		}
	}
}
