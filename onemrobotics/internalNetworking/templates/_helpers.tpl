{{/*
Expand the name of the chart.
*/}}
{{- define "internalNetworking.name" -}}
{{- default .Chart.Name .Values.internalNetworking.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "internalNetworking.fullname" -}}
{{- if .Values.internalNetworking.name }}
{{- .Values.internalNetworking.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.internalNetworking.name }}
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
{{- define "internalNetworking.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "internal-networking.selectorLabels" -}}
helm.sh/chart: {{ include "internalNetworking.chart" . }}
app.kubernetes.io/name: {{ .Values.internalNetworking.name }}
app.kubernetes.io/instance: {{ .Values.internalNetworking.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
