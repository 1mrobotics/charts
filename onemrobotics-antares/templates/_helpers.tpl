{{/*
Expand the name of the chart.
*/}}
{{- define "onemrobotics-antares.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "onemrobotics-antares.fullname" -}}
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
{{- define "onemrobotics-antares.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "control-app.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.controlapp.name }}
app.kubernetes.io/instance: {{ .Values.controlapp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "orchestrator.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.antares.name }}
app.kubernetes.io/instance: {{ .Values.antares.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "internal-networking.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.internalNetworking.name }}
app.kubernetes.io/instance: {{ .Values.internalNetworking.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "kiosk.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.kiosk.name }}
app.kubernetes.io/instance: {{ .Values.kiosk.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "lwms.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.lwms.name }}
app.kubernetes.io/instance: {{ .Values.lwms.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "rtsp.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.rtsp.name }}
app.kubernetes.io/instance: {{ .Values.rtsp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "video-app.selectorLabels" -}}
helm.sh/chart: {{ include "onemrobotics-antares.chart" . }}
app.kubernetes.io/name: {{ .Values.videoapp.name }}
app.kubernetes.io/instance: {{ .Values.videoapp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "onemrobotics-antares.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "onemrobotics-antares.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
