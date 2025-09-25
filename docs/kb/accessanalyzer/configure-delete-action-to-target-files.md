<h2>Related Query</h2>
<ul>
  <li>"We're trying to create a job that deletes files and need help with the delete action part of it."</li>
</ul>
<h2>Overview</h2>
<p>This article explains how to configure the File System delete action so that it reliably removes files and reports results without producing a misleading <strong><code>file missing </code></strong>error<strong><code></code></strong>. The issue typically appears when the action is configured to target a folder or a single UNC path column; the action deletes the file, but a subsequent check complains that the file cannot be found. The confirmed resolution is to update the input table and action to target the file explicitly. For more information about the File System Action Module, see: <a href="https://docs.netwrix.com/docs/accessanalyzer/12_0/admin/action/filesystem/overview" target="_blank" rel="noopener">File System Action Module</a>.</p>
<h2>Instructions</h2>
<blockquote>
  <p><span class="Caution"><strong>IMPORTANT: </strong></span>Back up your input table and test the updated action in a non-production environment before running delete jobs at scale. Deletions are irreversible if proper backups are not in place.</p>
</blockquote>
<ol>
  <li>Verify the action artifacts. Confirm that the action execution produced an&nbsp;<strong>input.db</strong> for the job. Look for the file in one of these locations: <ul>
      <li><code class="lang-Registry">\STEALTHbits\StealthAUDIT\FileSystemAM\Data\session-yyyymmddThhmmss\input.db</code>.</li>
      <li><code class="lang-Registry">Stealthbits\StealthAUDIT\Actions\FileSystem\yyyymmddThhmmss\HOST.input1.db</code>.</li>
    </ul>
  </li>
  <li>If <strong>input.db</strong> is missing. Someone may have deleted it. Reproduce the action in a test environment and collect the full Data/session folder after a job run. Provide that folder to support or development for analysis, or use it to validate your configuration locally.</li>
  <li>Adjust the input table. Add or verify the following columns in the source table used by the action: <ul>
      <li>Unique row identifier columns such as <strong>RowKey</strong> and <strong>RowGuid</strong>. (These were fixed during troubleshooting and allowed the job to run end to end.)</li>
      <li>Split the original UNC path into three separate columns: <strong>Server</strong>, <strong>FilePath</strong> (directory path), and <strong>FileName</strong> (file name with extension). For example, split <code class="lang-Registry">\\server\share\path\file.exe</code> into: <ul>
          <li><code class="lang-Registry">Server = server</code></li>
          <li><code class="lang-Registry">FilePath = \share\path\</code></li>
          <li><code class="lang-Registry">FileName = file.exe</code></li>
        </ul>
      </li>
    </ul>
  </li>
  <li>Update the File System action mapping. Edit the delete action so it uses the new <strong>Server</strong>, <strong>FilePath</strong>, and <strong>FileName</strong> columns to construct and target the full file path. Do not point the action only to the folder or to a single UNC column that includes both path and filename if the action expects explicit file targeting.</li>
  <li>Validate credentials. Ensure the account used by the action has sufficient permissions on the target server and share. In testing, using the long corporate profile credential was acceptable. Test with the same credentials in a lab before running in production.</li>
  <li>Run the job in a test environment. Confirm the following: <ul>
      <li>The action deletes the target files as expected.</li>
      <li>Task Stats and Action Results no longer show the misleading <strong><code>file missing </code></strong>error after successful deletion.</li>
    </ul>
  </li>
  <li>If results still show an error while files are removed, collect and attach the action Data/session folder (containing <strong>input.db</strong> and other artifacts) to further troubleshooting. The presence of the <strong>input.db</strong> allows engineering to verify whether the action attempted to target a file or a folder.</li>
</ol>
<blockquote>
  <p><span class="Note"><strong>NOTE: </strong></span>Every action execution normally produces an <strong>input.db</strong> in the session or Actions folder. If you cannot find <strong>input.db</strong>, check both locations above or confirm that no process has removed those files after the run.</p>
</blockquote>
<h2>Troubleshooting</h2>
<ul>
  <li>Job completes but the Action Results show a <strong><code>file missing </code></strong>error message: Confirm the action was configured to target the file. If it targeted only a folder or a single UNC column, split the UNC and map using three columns as described.</li>
  <li>No <strong>input.db</strong> file exists: Re-run the action in a test environment and capture the Data/session folder. If the file is absent from both the session and Actions folders, verify that nothing in your environment is deleting action artifacts post-run.</li>
  <li>Deletes fail due to permissions: Re-check the credentials used by the action and test access to the target files via the same account outside of the product.</li>
  <li>If the above steps do not resolve the <strong><code>file missing </code></strong>error, try either of the following options:</li>
  <ul>
    <li>Delete and recreate the job and action configuration.</li>
    <li>Create a new job with action configuration.</li>
  </ul>
</ul>
<h2>Related Link</h2>
<ul>
  <li><a href="https://docs.netwrix.com/docs/accessanalyzer/12_0/admin/action/filesystem/overview" target="_blank" rel="noopener">File System Action Module</a></li>
</ul>
