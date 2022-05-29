{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ntp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ntp.selectorLabels" -}}
helm.sh/chart: {{ include "ntp.chart" . }}
app.kubernetes.io/name: {{ .Values.ntp.name }}
app.kubernetes.io/instance: {{ .Values.ntp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}