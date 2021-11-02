#!/usr/bin/env -S yarn ts-node
import ShellJs from "shelljs";
import Path from "path";

const ModuleDir = Path.resolve(__dirname, "../modules");

const Modules = ["shell"];

async function main() {
  await buildAll();
}
main();

async function buildAll() {
  for (const m of Modules) {
    await buildModule(m);
  }
}

async function buildModule(name: string) {
  const moduleDir = Path.resolve(ModuleDir, name);

  ShellJs.cd(moduleDir);

  await ShellJs.exec("yarn install", { async: true });
  ShellJs.exec("yarn build");
}
