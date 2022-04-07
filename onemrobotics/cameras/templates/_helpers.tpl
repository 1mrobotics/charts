{{/*
Expand the name of the chart.
*/}}
{{- define "cameras.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rtsp.selectorLabels" -}}
helm.sh/chart: {{ include "cameras.chart" . }}
app.kubernetes.io/name: {{ .Values.rtsp.name }}
app.kubernetes.io/instance: {{ .Values.rtsp.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "httpsProxy.selectorLabels" -}}
helm.sh/chart: {{ include "cameras.chart" . }}
app.kubernetes.io/name: {{ .Values.httpsProxy.name }}
app.kubernetes.io/instance: {{ .Values.httpsProxy.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}