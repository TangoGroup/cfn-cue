package RoboMaker

import "github.com/TangoGroup/fn"

Fleet :: {
	Type: "AWS::RoboMaker::Fleet"
	Properties: {
		Name?: string | fn.Fn
		Tags?: {
		} | fn.Fn
	}
}
Robot :: {
	Type: "AWS::RoboMaker::Robot"
	Properties: {
		Architecture:      string | fn.Fn
		Fleet?:            string | fn.Fn
		GreengrassGroupId: string | fn.Fn
		Name?:             string | fn.Fn
		Tags?:             {
		} | fn.Fn
	}
}
RobotApplication :: {
	Type: "AWS::RoboMaker::RobotApplication"
	Properties: {
		CurrentRevisionId?: string | fn.Fn
		Name?:              string | fn.Fn
		RobotSoftwareSuite: propRobotSoftwareSuite
		Sources: [...propSourceConfig]
		Tags?: {
		} | fn.Fn
	}
	propRobotSoftwareSuite :: {
		Name:    string | fn.Fn
		Version: string | fn.Fn
	}
	propSourceConfig :: {
		Architecture: string | fn.Fn
		S3Bucket:     string | fn.Fn
		S3Key:        string | fn.Fn
	}
}
RobotApplicationVersion :: {
	Type: "AWS::RoboMaker::RobotApplicationVersion"
	Properties: {
		Application:        string | fn.Fn
		CurrentRevisionId?: string | fn.Fn
	}
}
SimulationApplication :: {
	Type: "AWS::RoboMaker::SimulationApplication"
	Properties: {
		CurrentRevisionId?:      string | fn.Fn
		Name?:                   string | fn.Fn
		RenderingEngine:         propRenderingEngine
		RobotSoftwareSuite:      propRobotSoftwareSuite
		SimulationSoftwareSuite: propSimulationSoftwareSuite
		Sources: [...propSourceConfig]
		Tags?: {
		} | fn.Fn
	}
	propRenderingEngine :: {
		Name:    string | fn.Fn
		Version: string | fn.Fn
	}
	propRobotSoftwareSuite :: {
		Name:    string | fn.Fn
		Version: string | fn.Fn
	}
	propSimulationSoftwareSuite :: {
		Name:    string | fn.Fn
		Version: string | fn.Fn
	}
	propSourceConfig :: {
		Architecture: string | fn.Fn
		S3Bucket:     string | fn.Fn
		S3Key:        string | fn.Fn
	}
}
SimulationApplicationVersion :: {
	Type: "AWS::RoboMaker::SimulationApplicationVersion"
	Properties: {
		Application:        string | fn.Fn
		CurrentRevisionId?: string | fn.Fn
	}
}
