# {{uppercase (regexReplace "^master$" pipeline.build.branch "staging")}} deployed
**Successfully** deployed {{pipeline.repo.owner}}/{{pipeline.repo.name}} [`{{pipeline.build.branch}}@{{truncate commit 7}}`]({{pipeline.build.link}}) -> https://<URL> [[diff]({{pipeline.commit.link}})]
FileContent: {{FileContent}}
Author: `{{pipeline.commit.author.username}}`
> {{pipeline.commit.message.title}}{{#if pipeline.commit.message.body}}
>
{{{regexReplace "(?m)^" pipeline.commit.message.body "> "}}}{{/if}}
