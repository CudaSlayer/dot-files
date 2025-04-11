local M = {}

local function ensure_directory_exists(path)
    local dir = vim.fn.fnamemodify(path, ':h')
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    end
end

function M.create_template(filename)
    local template = {
        '#include <bits/stdc++.h>',
        '',
        'using namespace std;',
        '  ',
        'typedef long long ll;',
        'typedef long double ld;',
        'typedef pair<int,int> p32;',
        'typedef pair<ll,ll> p64;',
        'typedef pair<double,double> pdd;',
        'typedef vector<ll> v64;',
        'typedef vector<int> v32;',
        'typedef vector<vector<int> > vv32;',
        'typedef vector<vector<ll> > vv64;',
        'typedef vector<vector<p64> > vvp64;',
        'typedef vector<p64> vp64;',
        'typedef vector<p32> vp32;',
        'typedef vector<bool> vb;',
        'typedef vector<vector<bool> > vbb;',
        ' ',
        'double eps = 1e-12;',
        '#define forn(i,e) for(int i = 0; i < e; i++)',
        '#define forsn(i,s,e) for(ll i = s; i < e; i++)',
        '#define rforn(i,s) for(ll i = s; i >= 0; i--)',
        '#define rforsn(i,s,e) for(ll i = s; i >= e; i--)',
        '#define ln "\\n"',
        '#define dbg(x) cout<<#x<<" = "<<x<<ln',
        '#define mp make_pair',
        '#define pb push_back',
        '#define fi first',
        '#define se second',
        '#define INF 2e18',
        '#define fast_cin() ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL)',
        '#define all(x) (x).begin(), (x).end()',
        '#define sz(x) ((ll)(x).size())',
        '#define pob pop_back ',
        '',
        'template <typename T>',
        'std::ostream& operator<<(std::ostream& os, const std::vector<T>& vec) {',
        '  for (auto it = vec.begin(); it != vec.end(); ++it) {',
        '    if (it != vec.begin()) { os << " "; }',
        '    os << *it;',
        '  }',
        '  return os;',
        '}',
        '',
        '',
        'void solve(){',
        '',
        '}  ',
        '',
        'int main(){',
        '   int tc=1;',
        '   //cin>>tc;',
        '   while(tc--) solve();',
        '   return  0;',
        '}'
    }
    
    -- Ensure the directory exists
    ensure_directory_exists(filename)

    -- Create a new buffer and set its name
    vim.cmd('enew')
    local buf = vim.api.nvim_get_current_buf()

    -- Set buffer options
    vim.api.nvim_buf_set_option(buf, 'buftype', '')
    vim.api.nvim_buf_set_option(buf, 'modifiable', true)
    vim.api.nvim_buf_set_option(buf, 'readonly', false)

    vim.api.nvim_buf_set_name(buf, filename)
    
    -- Set filetype to cpp and ensure the buffer is modifiable
    vim.api.nvim_buf_set_option(buf, 'filetype', 'cpp')

    -- vim.api.nvim_buf_set_name(0, filename)
    --
    -- -- Set filetype to cpp
    -- vim.bo.filetype = 'cpp'
    --
    -- Insert the template
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, template)
    -- vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
    
    -- Save the file
    vim.cmd('write ' .. vim.fn.fnameescape(filename))
    -- vim.cmd('write')
end

function M.prompt_and_create()
    vim.ui.input({prompt = "Enter filename (with optional path, without .cpp): "}, function(input)
        if input then
            local filename = input:match("%.cpp$") and input or input .. ".cpp"
            -- Get the absolute path
            local absolute_path = vim.fn.fnamemodify(filename, ':p')
            M.create_template(absolute_path)
        end
    end)
end

-- function M.prompt_and_create()
--     vim.ui.input({prompt = "Enter filename (without .cpp): "}, function(input)
--         if input then
--             local filename = input:match("%.cpp$") and input or input .. ".cpp"
--             M.create_template(filename)
--         end
--     end)
-- end
--

function M.setup()
    vim.api.nvim_create_user_command('CppTemplate', M.prompt_and_create, {})
    vim.api.nvim_set_keymap('n', '<Leader>cp', ':CppTemplate<CR>', { noremap = true, silent = true })
end

return M
