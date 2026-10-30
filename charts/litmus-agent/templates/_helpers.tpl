{{/*
Expand the name of the chart.
*/}}
{{- define "litmus-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "litmus-agent.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "litmus-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "litmus-agent.labels" -}}
helm.sh/chart: {{ include "litmus-agent.chart" . }}
{{ include "litmus-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.global.customLabels }}
{{ toYaml .Values.global.customLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "litmus-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "litmus-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common pod annotations
*/}}
{{- define "litmus-agent.podAnnotations" -}}
{{- if .Values.global.podAnnotations }}
{{ toYaml .Values.global.podAnnotations }}
{{- end }}
{{- if .Values.podAnnotations }}
{{ toYaml .Values.podAnnotations }}
{{- end }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "litmus-agent.serviceAccountName" -}}
{{- include "litmus-agent.fullname" . }}
{{- end }}

{{/*
Checksum of the values consumed by the install job. It is part of the job name
so that a change in any input recreates the job instead of patching an
immutable one.
*/}}
{{- define "litmus-agent.installJobChecksum" -}}
{{- $inputs := dict
  "appVersion" .Values.APP_VERSION
  "containerRuntimeExecutor" (index .Values "workflow-controller" "appSettings" "containerRuntimeExecutor")
  "image" (printf "%s:%s" .Values.image.repository (.Values.image.tag | default .Chart.Version))
  "infraConfigName" .Values.global.infraConfigName
  "infraDescription" .Values.INFRA_DESCRIPTION
  "infraMode" .Values.global.INFRA_MODE
  "infraName" .Values.INFRA_NAME
  "infraNodeSelector" .Values.INFRA_NODE_SELECTOR
  "infraSecretName" .Values.global.infraSecretName
  "infraType" .Values.INFRA_TYPE
  "litmusBackendURL" .Values.LITMUS_BACKEND_URL
  "litmusEnvironmentID" .Values.LITMUS_ENVIRONMENT_ID
  "litmusPassword" .Values.LITMUS_PASSWORD
  "litmusProjectID" .Values.LITMUS_PROJECT_ID
  "litmusURL" .Values.LITMUS_URL
  "litmusUsername" .Values.LITMUS_USERNAME
  "nsExists" .Values.NS_EXISTS
  "platformName" .Values.PLATFORM_NAME
  "podAnnotations" (include "litmus-agent.podAnnotations" .)
  "resources" .Values.resources
  "saExists" .Values.SA_EXISTS
  "skipSSL" .Values.SKIP_SSL
  "workflowConfigmapName" (index .Values "workflow-controller" "appSettings" "configmapName")
-}}
{{- toYaml $inputs | sha256sum | trunc 10 -}}
{{- end }}
