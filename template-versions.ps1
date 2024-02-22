[xml]$ShiftFrameworkGlobalSettings = Get-Content ShiftFrameworkGlobalSettings.props

$ShiftFrameworkVersion = $ShiftFrameworkGlobalSettings.Project.PropertyGroup.ShiftFrameworkVersion

$AzureFunctionsAspNetCoreAuthorization = $ShiftFrameworkGlobalSettings.Project.PropertyGroup.AzureFunctionsAspNetCoreAuthorization

$TemplateJsonPath = "ShiftTemplates\content\Framework Project\.template.config\template.json"

$TempalteJsonContent = Get-Content -Path $TemplateJsonPath | ConvertFrom-Json

$TempalteJsonContent.symbols.frameworkVersion.parameters.value = $ShiftFrameworkVersion

$TempalteJsonContent.symbols.azureFunctionsAspNetCoreAuthorizationVersion.parameters.value = $AzureFunctionsAspNetCoreAuthorization

$TempalteJsonContent | ConvertTo-Json -Depth 100 | Set-Content -Path $TemplateJsonPath	
