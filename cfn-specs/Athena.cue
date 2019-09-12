package Athena

NamedQuery :: {
	Type: "AWS::Athena::NamedQuery"
	Properties: {
		Database:     string
		Description?: string
		Name?:        string
		QueryString:  string
	}
}
