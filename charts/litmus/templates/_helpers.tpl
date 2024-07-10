{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "litmus-portal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "litmus-portal.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "litmus-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Specify default labels
*/}}
{{- define "litmus-portal.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ include "litmus-portal.name" . }}
app.kubernetes.io/part-of: {{ template "litmus-portal.name" . }}
app.kubernetes.io/version: "{{ .Chart.Version }}"
helm.sh/chart: {{ include "litmus-portal.chart" . }}
litmuschaos.io/version: {{ .Chart.AppVersion }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end }}
{{- end -}}

{{/*
Specify default selectors
*/}}
{{- define "litmus-portal.selectors" -}}
app.kubernetes.io/name: {{ include "litmus-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Check for existing secret
*/}}

{{- define "litmus-portal.secretname" -}}
    {{ if eq .Values.existingSecret "" }}
        {{- include "litmus-portal.fullname" $}}-admin-secret
    {{ else }}
      {{- printf "%s" (tpl .Values.existingSecret $) -}}
    {{- end -}}
{{- end -}}

{{/*
 Return true if a secret object should be created
*/}}
{{- define "litmus-portal.createSecret" -}}
    {{- if .Values.existingSecret -}}
    {{ else }}
        {{ true }}
    {{- end -}}
{{- end -}}

{{/*
 Returns mongodb connection string
*/}}
{{- define "litmus-portal.mongodbConnectionString" -}}
{{- $hosts := "" -}}
{{- $count := (.Values.mongodb.replicaCount | int) -}}
{{- range $i, $e := until $count -}}
  {{- $host := printf "%s-mongodb-%d.%s-mongodb-headless" $.Release.Name $i $.Release.Name -}}
  {{- $hosts = printf "%s%s:%d," $hosts $host 27017 -}}
{{- end -}}
mongodb://{{ trimSuffix "," $hosts  }}/admin
{{- end -}}

{{- define "litmus-portal.internalTLS.web.secretName" -}}
  {{- if eq .Values.internalTLS.certSource "secret" -}}
    {{- .Values.internalTLS.web.secretName -}}
  {{- else -}}
    {{- printf "%s-web-internal-tls" (include "litmus-portal.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{- define "litmus-portal.internalTLS.authServer.secretName" -}}
  {{- if eq .Values.internalTLS.certSource "secret" -}}
    {{- .Values.internalTLS.authServer.secretName -}}
  {{- else -}}
    {{- printf "%s-auth-server-internal-tls" (include "litmus-portal.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{- define "litmus-portal.internalTLS.graphqlServer.secretName" -}}
  {{- if eq .Values.internalTLS.certSource "secret" -}}
    {{- .Values.internalTLS.graphqlServer.secretName -}}
  {{- else -}}
    {{- printf "%s-graphql-server-internal-tls" (include "litmus-portal.fullname" .) -}}
  {{- end -}}
{{- end -}}

{{- define "litmus-portal.web" -}}
  {{- printf "%s-web" (include "litmus-portal.fullname" .) -}}
{{- end -}}

{{- define "litmus-portal.auth-server" -}}
  {{- printf "%s-auth-server" (include "litmus-portal.fullname" .) -}}
{{- end -}}

{{- define "litmus-portal.graphql-server" -}}
  {{- printf "%s-graphql-server" (include "litmus-portal.fullname" .) -}}
{{- end -}}

