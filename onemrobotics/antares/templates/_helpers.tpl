{{/*
Expand the name of the chart.
*/}}
{{- define "antares.name" -}}
{{- default .Chart.Name .Values.antares.name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "antares.fullname" -}}
{{- if .Values.antares.name }}
{{- .Values.antares.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.antares.name }}
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
{{- define "antares.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "control-app.selectorLabels" -}}
helm.sh/chart: {{ include "antares.chart" . }}
app.kubernetes.io/name: {{ .Values.controlapp.name }}
app.kubernetes.io/instance: {{ .Values.controlapp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "orchestrator.selectorLabels" -}}
helm.sh/chart: {{ include "antares.chart" . }}
app.kubernetes.io/name: {{ .Values.antares.name }}
app.kubernetes.io/instance: {{ .Values.antares.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "lwms.selectorLabels" -}}
helm.sh/chart: {{ include "antares.chart" . }}
app.kubernetes.io/name: {{ .Values.lwms.name }}
app.kubernetes.io/instance: {{ .Values.lwms.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "video-app.selectorLabels" -}}
helm.sh/chart: {{ include "antares.chart" . }}
app.kubernetes.io/name: {{ .Values.videoapp.name }}
app.kubernetes.io/instance: {{ .Values.videoapp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
