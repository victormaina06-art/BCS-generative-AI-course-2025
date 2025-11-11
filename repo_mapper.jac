walker repo_mapper {
    has repo_url;
    has repo_name;
    has file_tree;
    has readme_summary;

    can clone_repo;
    can generate_file_tree;
    can summarize_readme;

    report {
        "Repo Name": repo_name,
        "File Tree": file_tree,
        "README Summary": readme_summary
    }

    clone_repo {
        py_call: "repo_tools.clone_repo", repo_url -> repo_name;
    }

    generate_file_tree {
        py_call: "repo_tools.build_file_tree", repo_name -> file_tree;
    }

    summarize_readme {
        py_call: "repo_tools.summarize_readme", repo_name -> readme_summary;
    }

    entry {
        clone_repo();
        generate_file_tree();
        summarize_readme();
    }
}