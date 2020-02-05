# cfn-cue

This generates CUE schema from [CloudFormation Resource Specification](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-resource-specification.html). 

Specifically, it uses the [`cfn-python-lint`](https://github.com/aws-cloudformation/cfn-python-lint) extended specs (e.g. [`us-west-2`](https://raw.githubusercontent.com/aws-cloudformation/cfn-python-lint/master/src/cfnlint/data/CloudSpecs/us-west-2.json)). 

You can get the latest specs by running `go run .` in the root of this repo. That will generate specs in [`pkg/github.com/TangoGroup/aws`](pkg/github.com/TangoGroup/aws).

Another important file is `pkg/github.com/TangoGroup/aws/fn/fn.cue`. This defines the [CloudFormation Intrinsic Functions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html). I'm currently having issues with this...
