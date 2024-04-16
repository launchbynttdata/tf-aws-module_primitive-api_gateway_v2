package testimpl

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/apigatewayv2"
	apitypes "github.com/aws/aws-sdk-go-v2/service/apigatewayv2/types"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	t.Run("TestApiGatewayV2Exists", func(t *testing.T) {
		awsApiGatewayId := terraform.Output(t, ctx.TerratestTerraformOptions(), "api_gateway_id")
		awsApiGatewayProtocolType := terraform.Output(t, ctx.TerratestTerraformOptions(), "api_protocol_type")
		awsClient := GetAWSApiGatewayV2Client(t)
		output, err := awsClient.GetApi(context.TODO(), &apigatewayv2.GetApiInput{
			ApiId: &awsApiGatewayId,
		})

		if err != nil {
			t.Errorf("Failure during GetApi: %v", err)
		}

		assert.Equal(t, *output.ApiId, awsApiGatewayId, "Expected ID did not match actual ID!")
		assert.Equal(t, output.ProtocolType, apitypes.ProtocolType(awsApiGatewayProtocolType), "Expected protocol type did not match actual!")
	})
}

func GetAWSApiGatewayV2Client(t *testing.T) *apigatewayv2.Client {
	awsApiGatewayV2Client := apigatewayv2.NewFromConfig(GetAWSConfig(t))
	return awsApiGatewayV2Client
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}
