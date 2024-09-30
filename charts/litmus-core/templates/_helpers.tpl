{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "litmus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "litmus.fullname" -}}
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
{{- define "litmus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate common labels */}}
{{- define "litmus.commonLabels" }}
app.kubernetes.io/component: litmus-infra
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ template "litmus.name" . }} 
app.kubernetes.io/version: "{{ .Chart.Version }}"
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }} 
litmuschaos.io/version: {{ .Chart.AppVersion }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end }}
{{- end }}

{{/* Generate chaos-operator labels*/}}
{{- define "litmus.operatorLabels" }}
{{ include "litmus.commonLabels" . }}
{{ include "litmus.operatorSelectors" . }}
{{- end }}

{{/* Chaos operator selectors labels */}}
{{- define "litmus.operatorSelectors" }}
app: {{ template "litmus.name" . }}
app.kubernetes.io/name: {{ template "litmus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate chaos-exporter labels*/}}
{{- define "litmus.exporterLabels" }}
{{ include "litmus.commonLabels" . }}
{{ include "litmus.exporterSelectors" . }}
{{- end }}

{{/* Chaos exporter selectors labels */}}
{{- define "litmus.exporterSelectors" }}
app: {{ template "litmus.name" . }}
app.kubernetes.io/name: {{ template "litmus.name" . }}-monitor
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}