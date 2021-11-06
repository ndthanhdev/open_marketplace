import React from "react";
import { Grid } from "../../components/grid";
import { WidgetContainer } from "../../components/widget-container";

interface Shell {}

let Shell: React.FC<Shell> = (props) => {
  return (
    <div
      style={{
        minWidth: "100vw",
        minHeight: "100vh",
      }}
    >
      <Grid columnCount={32}>
        <WidgetContainer top={6} left={6} width={6} height={6} />
      </Grid>
    </div>
  );
};

export default Shell;
