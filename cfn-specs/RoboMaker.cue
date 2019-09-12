package RoboMaker

Fleet :: {
	Type: "AWS::RoboMaker::Fleet"
	Properties: {
		Name?: string
		Tags?: {
		}
	}
}
Robot :: {
	Type: "AWS::RoboMaker::Robot"
	Properties: {
		Architecture:      string
		Fleet?:            string
		GreengrassGroupId: string
		Name?:             string
		Tags?: {
		}
	}
}
RobotApplication :: {
	Type: "AWS::RoboMaker::RobotApplication"
	Properties: {
		CurrentRevisionId?: string
		Name?:              string
		RobotSoftwareSuite: __RobotSoftwareSuite
		Sources: [...__SourceConfig]
		Tags?: {
		}
	}
	__RobotSoftwareSuite = {
		Name:    string
		Version: string
	}
	__SourceConfig = {
		Architecture: string
		S3Bucket:     string
		S3Key:        string
	}
}
RobotApplicationVersion :: {
	Type: "AWS::RoboMaker::RobotApplicationVersion"
	Properties: {
		Application:        string
		CurrentRevisionId?: string
	}
}
SimulationApplication :: {
	Type: "AWS::RoboMaker::SimulationApplication"
	Properties: {
		CurrentRevisionId?:      string
		Name?:                   string
		RenderingEngine:         __RenderingEngine
		RobotSoftwareSuite:      __RobotSoftwareSuite
		SimulationSoftwareSuite: __SimulationSoftwareSuite
		Sources: [...__SourceConfig]
		Tags?: {
		}
	}
	__RenderingEngine = {
		Name:    string
		Version: string
	}
	__RobotSoftwareSuite = {
		Name:    string
		Version: string
	}
	__SimulationSoftwareSuite = {
		Name:    string
		Version: string
	}
	__SourceConfig = {
		Architecture: string
		S3Bucket:     string
		S3Key:        string
	}
}
SimulationApplicationVersion :: {
	Type: "AWS::RoboMaker::SimulationApplicationVersion"
	Properties: {
		Application:        string
		CurrentRevisionId?: string
	}
}
