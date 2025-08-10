import * as React from 'react';

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';

function Header() {
  return (
    <AppBar position="static" color="transparent">
      <Container maxWidth="md">
        <Toolbar disableGutters>
          <Box sx={{ flexGrow: 1, justifyContent: 'space-between', display: { xs: 'flex' } }}>
            <Typography
              variant="h6"
              noWrap
              component="a"
              href="/products"
              sx={{
                mr: 2,
                display: { xs: 'none', md: 'flex' },
                fontFamily: 'monospace',
                fontWeight: 700,
                letterSpacing: '.3rem',
                color: 'inherit',
                textDecoration: 'none',
              }}
            >
              CR
            </Typography>
            <IconButton
              size="large"
              aria-label="cart"
              aria-controls="menu-appbar"
              aria-haspopup="true"
              href="/cart"
              color="inherit"
            >
              <ShoppingCartIcon />
            </IconButton>
          </Box>
        </Toolbar>
      </Container>
    </AppBar>
  );
}

export default Header;