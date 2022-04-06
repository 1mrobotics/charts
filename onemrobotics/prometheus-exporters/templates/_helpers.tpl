{{- define "prometheusExporters.imagePullSecrets" }}
imagePullSecrets:
  - name: {{ default "azreg" .Values.imagePullSecret}}
{{- end}}
