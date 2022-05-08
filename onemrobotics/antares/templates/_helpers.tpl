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
app.kubernetes.io/name: {{ .Values.orchestrator.name }}
app.kubernetes.io/instance: {{ .Values.orchestrator.name }}
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

{{- define "kiosk-logger.selectorLabels" -}}
helm.sh/chart: {{ include "antares.chart" . }}
app.kubernetes.io/name: {{ .Values.kiosklogger.name }}
app.kubernetes.io/instance: {{ .Values.kiosklogger.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

