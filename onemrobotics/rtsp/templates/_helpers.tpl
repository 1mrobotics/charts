{{/*
Expand the name of the chart.
*/}}
{{- define "rtsp.name" -}}
{{- default .Chart.Name .Values.rtsp.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rtsp.fullname" -}}
{{- if .Values.rtsp.name }}
{{- .Values.rtsp.name | trunc 63 | trimSuffix "-" }}
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
{{- define "rtsp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rtsp.selectorLabels" -}}
helm.sh/chart: {{ include "rtsp.chart" . }}
app.kubernetes.io/name: {{ .Values.rtsp.name }}
app.kubernetes.io/instance: {{ .Values.rtsp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

