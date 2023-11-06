return {
	-- DB interface
	{
		'tpope/vim-dadbod',
		ft = { 'sql', 'mysql', 'pgsql', 'sqlite' },
	},

	-- UI for DB interface
	{
		'kristijanhusak/vim-dadbod-ui',
		ft = { 'sql', 'mysql', 'pgsql', 'sqlite' },
	},

	-- Postgres driver
	{
		'jackc/pgx',
		ft = { 'sql', 'mysql', 'pgsql', 'sqlite' },
	},
}
