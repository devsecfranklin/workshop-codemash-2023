## GH Action YAML File

    name: 'codemash-cloudbot'
    on:
    - pull_request
    env:
    PR_NUMBER: ${{ github.event.pull_request.number }}
    jobs:
    phone-home:
        name: 'codemash-cloudbot'
        runs-on: ubuntu-latest
        steps:
        - name: Set up Cloud SDK
            uses: 'google-github-actions/setup-gcloud@v0'
            with:
            project_id: ${{ secrets.PROJECT_ID }}
            service_account_key: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS }}
            export_default_credentials: true
        - name: Use gcloud CLI
            run: |
            curl --request POST \
                --header "Content-Type:application/json" \
                --header "Authorization: Bearer $(gcloud auth print-identity-token)" \
                --data "{\"message\": \"Pull request number $PR_NUMBER by \
                $GITHUB_ACTOR on repository $GITHUB_REPOSITORY\", \"pr_number\": \
                \"$PR_NUMBER\", \"user\": \"$GITHUB_ACTOR\", \"repo\": \
                \"$GITHUB_REPOSITORY\", \"ref\": \"$GITHUB_REF\", \"commit_sha\": \
                \"$GITHUB_SHA\"}" \
                \ https://us-central1-gcp-gcs-pso.cloudfunctions.net/codemash-cloudbot
