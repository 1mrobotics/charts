{{/*
Expand the name of the chart.
*/}}
{{- define "kiosk.name" -}}
{{- default .Chart.Name .Values.kiosk.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kiosk.fullname" -}}
{{- if .Values.kiosk.name }}
{{- .Values.kiosk.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.kiosk.name }}
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
{{- define "kiosk.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kiosk.selectorLabels" -}}
helm.sh/chart: {{ include "kiosk.chart" . }}
app.kubernetes.io/name: {{ .Values.kiosk.name }}
app.kubernetes.io/instance: {{ .Values.kiosk.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

