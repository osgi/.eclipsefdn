local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('osgi') {
  settings+: {
    blog: "https://www.osgi.org",
    description: "The Dynamic Module System for Java",
    members_can_fork_private_repositories: true,
    name: "OSGi Working Group",
    security_managers+: [
      "osgi-security-team"
    ],
    twitter_username: "OSGiWG",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      selected_repositories+: [
        "osgi",
        "osgi-test",
        "osgi.enroute",
        "slf4j-osgi"
      ],
      value: "********",
      visibility: "selected",
    },
    orgs.newOrgSecret('OSSRH_PASSWORD') {
      selected_repositories+: [
        "osgi",
        "osgi-test",
        "osgi.enroute",
        "slf4j-osgi"
      ],
      value: "pass:bots/technology.osgi-technology/oss.sonatype.org/gh-token-password",
      visibility: "selected",
    },
    orgs.newOrgSecret('OSSRH_USERNAME') {
      selected_repositories+: [
        "osgi",
        "osgi-test",
        "osgi.enroute",
        "slf4j-osgi"
      ],
      value: "pass:bots/technology.osgi-technology/oss.sonatype.org/gh-token-username",
      visibility: "selected",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Community Health",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('bindex') {
      archived: true,
      default_branch: "master",
      description: "OSGi Bundle Repository Indexer MOVED to https://github.com/bndtools/bnd/tree/master/org.osgi.impl.bundle.repoindex.cli",
      has_issues: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('bugzilla-archive') {
      archived: true,
      default_branch: "master",
      description: "Archive of OSGi Alliance Specification Bugzilla bugs. The Specification Bugzilla system was decommissioned with the move to GitHub. The issues in this repository are imported from the Specification Bugzilla system for archival purposes.",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('bundles') {
      archived: true,
      default_branch: "master",
      description: "REPLACED BY osgi.enroute",
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('design') {
      archived: true,
      description: "OSGi design repository",
      has_projects: false,
      homepage: "",
      topics+: [
        "feedback",
        "osgi"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('docs') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "gh-pages",
      dependabot_alerts_enabled: false,
      description: "OSGi Specification Project Documentation Website. Specifications, Javadoc, and more.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_projects: false,
      has_wiki: false,
      homepage: "https://docs.osgi.org",
      topics+: [
        "downloads",
        "javadoc",
        "osgi",
        "reference",
        "specification",
        "whitepaper"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_action_patterns+: [
          "ruby/setup-ruby@*"
        ],
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('eclipse-ata') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "OSGi Assets to Transfer",
      private: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('eclipsecon') {
      archived: true,
      default_branch: "master",
      description: "Some tutorials from past OSGi DevCons",
      has_issues: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('materials') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Published OSGi Materials. All releases of the OSGi specifications and TCKs are stored here for archival purposes.",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "OSGi Specification Project Build Repository. Specification, API, implementation, and TCK source code.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://docs.osgi.org/",
      topics+: [
        "eclipse",
        "osgi",
        "osgi-specification",
        "specification",
        "working-group"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_action_patterns+: [
          "gradle/gradle-build-action@*",
          "gradle/wrapper-validation-action@*",
          "peaceiris/actions-gh-pages@*"
        ],
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('osgi-test') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Testing support for OSGi. Includes JUnit 4 and JUnit 5 support and AssertJ support.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/docs",
      homepage: "https://osgi.github.io/osgi-test/",
      topics+: [
        "assertj",
        "assertj-support",
        "junit",
        "junit4",
        "junit5",
        "osgi",
        "osgi-testing",
        "test",
        "testing"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_action_patterns+: [
          "gradle/gradle-build-action@*",
          "gradle/wrapper-validation-action@*",
          "step-security/harden-runner@*"
        ],
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('osgi.enroute') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "The OSGi enRoute project provides a programming model of OSGi applications. This project contains bundles providing the API for the OSGi enRoute base profile and bundles for the OSGi enRoute project. The base profile establishes a runtime that contains a minimal set of services that can be used as a base for applications.",
      homepage: "https://enroute.osgi.org/",
      topics+: [
        "java",
        "osgi-applications",
        "osgi-enroute"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
      secrets: [
        orgs.newRepoSecret('REPOSITORY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('REPOSITORY_USERNAME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('osgi.enroute.blog') {
      archived: true,
      default_branch: "00-initial",
      description: "A tutorial to demonstrate how to build HTML-5 Applications with OSGi",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.bundles') {
      archived: true,
      default_branch: "master",
      description: "REPLACED BY osgi.enroute",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.example.knowhowlab.testing') {
      archived: true,
      default_branch: "master",
      description: "In progress ... will be an OSGi enRoute testing example",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples') {
      archived: true,
      default_branch: "master",
      description: "A repository with small examples showing off OSGi",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('osgi.enroute.examples.concurrency') {
      archived: true,
      default_branch: "master",
      description: "Examples for the Concurrency best practices App Note on enRoute http://enroute.osgi.org/appnotes/concurrency.html",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples.eval') {
      archived: true,
      default_branch: "master",
      description: "A Maven+vi only OSGi enRoute example",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('osgi.enroute.examples.jdbc') {
      archived: true,
      default_branch: "master",
      description: "A project used to develop the way OSGi enRoute could use persistence",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples.ledovermqtt') {
      archived: true,
      default_branch: "master",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples.maven') {
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Provides an example of a setup with the Maven Bnd Repository Plugin.",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples.polymer') {
      archived: true,
      default_branch: "master",
      description: "An example OSGi enRoute application using Polymer",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.examples.vaadin') {
      archived: true,
      default_branch: "master",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.site') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "gh-pages",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "GitHub Pages repo for OSGi enRoute website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_wiki: false,
      homepage: "https://enroute.osgi.org/",
      topics+: [
        "osgi-enroute-website"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_action_patterns+: [
          "ruby/setup-ruby@*"
        ],
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('osgi.enroute.template') {
      archived: true,
      default_branch: "master",
      description: "REPLACED BY osgi.enroute",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.enroute.trains') {
      archived: true,
      default_branch: "master",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.iot.contest.sdk') {
      archived: true,
      default_branch: "master",
      description: "The OSGi IoT Trains SDK.  A description of the architecture is available at http://enroute.osgi.org/trains/200-architecture.html",
      homepage: "http://enroute.osgi.org/trains/200-architecture.html",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('osgi.security-tests') {
      archived: true,
      default_branch: "master",
      description: "Security Best Practices Tests for OSGi Framework Implementations",
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('slf4j-osgi') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "SLF4J Binding for OSGi Log Service",
      topics+: [
        "osgi",
        "slf4j-binding",
        "slf4j-osgi"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        allow_action_patterns+: [
          "step-security/harden-runner@*"
        ],
        allow_verified_creator_actions: false,
        allowed_actions: "selected",
      },
    },
    orgs.newRepo('v2archive.osgi.enroute') {
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "An archive of the OSGi enRoute v2 repo. This enRoute v2 archive repo is kept as a resource for those already using OSGi enRoute v2. If you are new to OSGi enRoute, then please start with the latest OSGi enRoute at https://enroute.osgi.org/. ",
      homepage: "https://v2archive.enroute.osgi.org/",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('v2archive.osgi.enroute.site') {
      archived: true,
      default_branch: "gh-pages",
      dependabot_security_updates_enabled: true,
      description: "An archive of the OSGi enRoute v2 website. This enRoute v2 archive site is kept as a resource for those already using OSGi enRoute v2. If you are new to OSGi enRoute, then please start with the latest OSGi enRoute at  https://enroute.osgi.org/.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://v2archive.enroute.osgi.org/",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('v2archive.osgi.enroute.workspace') {
      archived: true,
      default_branch: "master",
      description: "An archive of the OSGi enRoute v2 workspace. This enRoute v2 archive workspace is kept as a resource for those already using OSGi enRoute v2. If you are new to OSGi enRoute, then please start with the latest OSGi enRoute at https://enroute.osgi.org/. ",
      homepage: "",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('whiteboard-pattern') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Example code for the OSGi Whiteboard Pattern whitepaper",
      homepage: "https://docs.osgi.org/whitepaper/whiteboard-pattern/",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('workspace') {
      archived: true,
      default_branch: "master",
      description: "REPLACED BY enroute.workspace",
      homepage: "",
      web_commit_signoff_required: false,
    },
  ],
}
