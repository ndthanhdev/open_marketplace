import React from "react";
import { Grid } from "../../components/grid";
import { WidgetContainer } from "../../components/widget-container";
import { useTokenQuery } from "./types";

interface Shell {}

let Shell: React.FC<Shell> = (props) => {
  const { data } = useTokenQuery();

  return (
    <div
      style={{
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
      }}
    >
      {data}
      <Grid columnCount={32}>
        <WidgetContainer x={6} y={16} width={6} height={2} />
      </Grid>
    </div>
  );
};

export default Shell;
